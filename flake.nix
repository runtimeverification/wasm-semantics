{
  description = "K Semantics of WebAssembly";

  inputs = {
    k-framework.url = "github:runtimeverification/k/v7.0.111";
    nixpkgs.follows = "k-framework/nixpkgs";
    flake-utils.follows = "k-framework/flake-utils";
    rv-utils.follows = "k-framework/rv-utils";
    pyk.url = "github:runtimeverification/k/v7.0.111?dir=pyk";
    nixpkgs-pyk.follows = "pyk/nixpkgs";
    poetry2nix.follows = "pyk/poetry2nix";
  };

  outputs =
    { self, k-framework, nixpkgs, flake-utils, rv-utils, pyk, ... }@inputs:
    let
      overlay = (final: prev:
        let
          src = prev.lib.cleanSource (prev.nix-gitignore.gitignoreSourcePure [
            "/.github"
            "flake.lock"
            ./.gitignore
          ] ./.);

          version = self.rev or "dirty";

          nixpkgs-pyk = import inputs.nixpkgs-pyk {
            system = prev.system;
            overlays = [ pyk.overlay ];
          };

          python310-pyk = nixpkgs-pyk.python310;

          poetry2nix = inputs.poetry2nix.lib.mkPoetry2Nix { pkgs = nixpkgs-pyk; };
        in {
          pyk = pyk.packages.${prev.system}.pyk;

          kwasm = prev.stdenv.mkDerivation {
            pname = "kwasm";
            inherit src version;

            buildInputs = with final; [
              k-framework.packages.${system}.k
              final.kwasm-pyk 
              python310-pyk
            ];

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
                --prefix PATH : ${
                  prev.lib.makeBinPath [
                    prev.which
                    k-framework.packages.${prev.system}.k
                  ]
                } \
                --set KDIST_DIR $out
            '';
          };

          kwasm-pyk = poetry2nix.mkPoetryApplication {
            python = nixpkgs-pyk.python310;
            projectDir = ./pykwasm;
            src = rv-utils.lib.mkPykAppSrc {
              pkgs = import nixpkgs { system = prev.system; };
              src = ./pykwasm;
              cleaner = poetry2nix.cleanPythonSources;
            };
            overrides = poetry2nix.overrides.withDefaults
            (finalPython: prevPython: {
              pyk = nixpkgs-pyk.pyk-python310;
              xdg-base-dirs = prevPython.xdg-base-dirs.overridePythonAttrs
                (old: {
                  propagatedBuildInputs = (old.propagatedBuildInputs or [ ])
                    ++ [ finalPython.poetry ];
                });
              py-wasm = prevPython.py-wasm.overridePythonAttrs
                (
                  old: {
                    buildInputs = (old.buildInputs or [ ]) ++ [ prevPython.setuptools ];
                  }
                );
              });
            groups = [ ];
            checkGroups = [ ];
          };

          kwasm-test = prev.stdenv.mkDerivation {
            inherit version;

            pname = "kwasm-test";
            src = final.kwasm.src;

            buildInputs = with final; [
              kwasm
              kwasm-pyk
              which
              git
            ];

            patchPhase = ''
              substituteInPlace Makefile                                                  \
                --replace-fail '$(TEST)'        '${final.kwasm}/bin/kwasm'                \
                --replace-fail '$(KDIST)'       '${nixpkgs-pyk.pyk-python310}/bin/kdist'  \
                --replace-fail '$(SOURCE_DIR)'  '${final.kwasm}/wasm-semantics/source'
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
          overlays = [ overlay ];
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
