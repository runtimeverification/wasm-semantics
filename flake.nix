{
  description = "K Semantics of WebAssembly";

  inputs = {
    k-framework.url = "github:runtimeverification/k/v7.1.191";
    nixpkgs.follows = "k-framework/nixpkgs";
    flake-utils.follows = "k-framework/flake-utils";
    rv-utils.follows = "k-framework/rv-utils";
    poetry2nix.follows = "k-framework/poetry2nix";
  };

  outputs = { self, k-framework, nixpkgs, flake-utils, rv-utils, ... }@inputs:
    let
      overlay = (final: prev:
        let
          src = prev.lib.cleanSource (prev.nix-gitignore.gitignoreSourcePure [
            "/.github"
            "flake.lock"
            ./.gitignore
          ] ./.);
          poetry2nix = inputs.poetry2nix.lib.mkPoetry2Nix { pkgs = prev; };
          version = self.rev or "dirty";
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

          kwasm-pyk = poetry2nix.mkPoetryApplication {
            python = prev.python310;
            projectDir = ./pykwasm;

            overrides = poetry2nix.overrides.withDefaults
              (finalPython: prevPython: {
                kframework = prev.pyk-python310;
                py-wasm = prevPython.py-wasm.overridePythonAttrs (old: {
                  buildInputs = (old.buildInputs or [ ])
                    ++ [ prevPython.setuptools ];
                });
              });

            checkGroups = [ ];
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
