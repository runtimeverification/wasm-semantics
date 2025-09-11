{
  description = "K Semantics of WebAssembly";

  inputs = {
    rv-nix-tools.url = "github:runtimeverification/rv-nix-tools/854d4f05ea78547d46e807b414faad64cea10ae4";
    nixpkgs.follows = "rv-nix-tools/nixpkgs";

    flake-utils.url = "github:numtide/flake-utils";

    k-framework.url = "github:runtimeverification/k/v7.1.268";
    k-framework.inputs.nixpkgs.follows = "nixpkgs";

    uv2nix.url = "github:pyproject-nix/uv2nix/680e2f8e637bc79b84268949d2f2b2f5e5f1d81c";
    # stale nixpkgs is missing the alias `lib.match` -> `builtins.match`
    # therefore point uv2nix to a patched nixpkgs, which introduces this alias
    # this is a temporary solution until nixpkgs us up-to-date again
    uv2nix.inputs.nixpkgs.url = "github:runtimeverification/nixpkgs/libmatch";
    # uv2nix.inputs.nixpkgs.follows = "nixpkgs";
    pyproject-build-systems.url = "github:pyproject-nix/build-system-pkgs/7dba6dbc73120e15b558754c26024f6c93015dd7";
    pyproject-build-systems = {
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.uv2nix.follows = "uv2nix";
      inputs.pyproject-nix.follows = "uv2nix/pyproject-nix";
    };
    pyproject-nix.follows = "uv2nix/pyproject-nix";

  };

  outputs = { self, rv-nix-tools, nixpkgs, flake-utils, k-framework, uv2nix, pyproject-nix, pyproject-build-systems }@inputs:
    let
      overlay = (final: prev:
        let
          src = prev.lib.cleanSource (prev.nix-gitignore.gitignoreSourcePure [
            "/.github"
            "flake.lock"
            ./.gitignore
          ] ./.);
          version = self.rev or "dirty";
          pythonVer = "310";
        in {
          kwasm = prev.stdenv.mkDerivation {
            pname = "kwasm";
            inherit src version;

            buildInputs = with prev; [ k final.kwasm-pyk python310 ];

            nativeBuildInputs = [ prev.makeWrapper ];

            enableParallelBuilding = true;

            buildPhase = ''
              export XDG_CACHE_HOME=$(pwd)
              kdist -v build -j4
            '';

            installPhase = ''
              mkdir -p $out
              cp -r ./kdist-*/* $out/
              mkdir -p $out/bin
              makeWrapper ${final.kwasm-pyk}/bin/kwasm $out/bin/kwasm \
                --prefix PATH : ${prev.lib.makeBinPath [ prev.which prev.k ]} \
                --set KDIST_DIR $out
            '';
          };

          kwasm-pyk = final.callPackage ./nix/kwasm-pyk {
            inherit pyproject-nix pyproject-build-systems uv2nix;
            python = final."python${pythonVer}";
          };

          kwasm-test = prev.stdenv.mkDerivation {
            inherit version;

            pname = "kwasm-test";
            src = final.kwasm.src;

            buildInputs = with final; [ kwasm kwasm-pyk which git ];

            patchPhase = with final; ''
              substituteInPlace Makefile                                                  \
                --replace-fail '$(TEST)'        '${kwasm}/bin/kwasm'                \
                --replace-fail '$(KDIST)'       '${pyk-python310}/bin/kdist'  \
                --replace-fail '$(SOURCE_DIR)'  '${kwasm}/wasm-semantics/source'
            '';

            buildPhase = ''
              export XDG_CACHE_HOME=$(pwd)
              make                          \
                NIX=1                       \
                -j$NIX_BUILD_CORES          \
                test
            '';

            installPhase = ''
              touch $out
            '';
          };
        });
    in flake-utils.lib.eachSystem [
      "x86_64-linux"
      "x86_64-darwin"
      "aarch64-linux"
      "aarch64-darwin"
    ] (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ k-framework.overlay overlay ];
        };
      in {
        packages = rec {
          inherit (pkgs) kwasm kwasm-pyk kwasm-test;
          default = kwasm;
        };
      }) // {
        overlays.default = overlay;
      };
}
