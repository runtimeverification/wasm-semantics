{
  description = "K Semantics of WebAssembly";

  inputs = {
    k-framework.url = "github:runtimeverification/k/v6.3.74";
    nixpkgs.follows = "k-framework/nixpkgs";
    flake-utils.follows = "k-framework/flake-utils";
    rv-utils.follows = "k-framework/rv-utils";
    pyk.url = "github:runtimeverification/pyk/v0.1.775";
    poetry2nix.follows = "pyk/poetry2nix";
  };

  outputs =
    { self, k-framework, nixpkgs, flake-utils, rv-utils, pyk, ... }:
    let
      overlay = (final: prev: {
        src = prev.lib.cleanSource (prev.nix-gitignore.gitignoreSourcePure [
          "/.github"
          "flake.lock"
          ./.gitignore
        ] ./.);

        version = self.rev or "dirty";

        kwasm-unwrapped = prev.stdenv.mkDerivation {
          inherit (final) src version;

          pname = "kwasm-unwrapped";

          dontBuild = true;

          installPhase = ''
            mkdir -p $out/bin
            cp ./kwasm $out/bin
            cp ./preprocessor.py $out/bin
          '';

          fixupPhase = ''
            patchShebangs "$out/bin/kwasm"
            substituteInPlace "$out/bin/kwasm" \
              --replace-warn "git rev-parse --short HEAD" 'echo ${self.rev or "dirty"}'
          '';
        };

        kwasm = prev.stdenv.mkDerivation {
          inherit (final) src version;

          pname = "kwasm";

          buildInputs = with prev; [
            final.kwasm-unwrapped
            k-framework.packages.${system}.k
            python310
            which
            z3
          ];

          nativeBuildInputs = [ prev.makeWrapper ];

          buildPhase = ''
            make build -j$NIX_BUILD_CORES
          '';

          installPhase = ''
            mkdir -p "$out/lib/kwasm"
            cp -r .build/* "$out/lib/kwasm"

            makeWrapper ${final.kwasm-unwrapped}/bin/kwasm "$out/bin/kwasm" \
              --run 'export USAGE_NAME=$0' \
              --set KWASM_DEFN_DIR "$out/lib/kwasm/defn" \
              --prefix PATH : ${
                prev.lib.makeBinPath [
                  k-framework.packages.${prev.system}.k
                  prev.python310
                  prev.which
                  prev.z3
                ]
              }
          '';
        };

        kwasm-test = prev.stdenv.mkDerivation {
          inherit (final) src version;

          pname = "kwasm-test";

          buildInputs = with prev; [
            final.kwasm
            which
            git
          ];

          buildPhase = ''
            make \
              -j$NIX_BUILD_CORES \
              TEST=${final.kwasm}/bin/kwasm \
              KWASM_DIR=. \
              DEFN_DIR="${final.kwasm}/lib/kwasm/defn" \
              test-conformance-parse test-simple test-conformance-supported test-prove
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
          overlays = [ overlay ];
        };
      in {
        packages = rec {
          inherit (pkgs) kwasm kwasm-test;
          default = kwasm;
        };
    }) // {
      overlays.default = overlay;
    };
}
