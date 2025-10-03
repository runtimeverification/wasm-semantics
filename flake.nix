{
  description = "K Semantics of WebAssembly";

  inputs = {
    rv-nix-tools.url = "github:runtimeverification/rv-nix-tools/854d4f05ea78547d46e807b414faad64cea10ae4";
    nixpkgs.follows = "rv-nix-tools/nixpkgs";

    k-framework.url = "github:runtimeverification/k/v7.1.288";
    k-framework.inputs.nixpkgs.follows = "nixpkgs";

    flake-utils.follows = "k-framework/flake-utils";

    uv2nix.url = "github:pyproject-nix/uv2nix/680e2f8e637bc79b84268949d2f2b2f5e5f1d81c";
    # stale nixpkgs is missing the alias `lib.match` -> `builtins.match`
    # therefore point uv2nix to a patched nixpkgs, which introduces this alias
    # this is a temporary solution until nixpkgs us up-to-date again
    uv2nix.inputs.nixpkgs.url = "github:runtimeverification/nixpkgs/libmatch";
    # uv2nix.inputs.nixpkgs.follows = "nixpkgs";
    pyproject-build-systems.url = "github:pyproject-nix/build-system-pkgs/dbfc0483b5952c6b86e36f8b3afeb9dde30ea4b5";
    pyproject-build-systems = {
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.uv2nix.follows = "uv2nix";
      inputs.pyproject-nix.follows = "uv2nix/pyproject-nix";
    };
    pyproject-nix.follows = "uv2nix/pyproject-nix";
  };

  outputs = {
      self,
      rv-nix-tools,
      nixpkgs,
      flake-utils,
      k-framework,
      uv2nix,
      pyproject-nix,
      pyproject-build-systems,
      ... }:
  let
    pythonVer = "310";
  in flake-utils.lib.eachDefaultSystem (system:
    let
      uvOverlay = final: prev: {
        uv = uv2nix.packages.${final.system}.uv-bin;
      };
      # create custom overlay for k, because the overlay in k-framework currently also includes a lot of other stuff instead of only k
      kOverlay = final: prev: {
        k = k-framework.packages.${final.system}.k;
      };
      kwasmOverlay = final: prev:
      let
        python = final."python${pythonVer}";
        kwasm-pyk = final.callPackage ./nix/kwasm-pyk {
          inherit pyproject-nix pyproject-build-systems uv2nix python;
        };
        kwasm = final.callPackage ./nix/kwasm {
          inherit kwasm-pyk;
          rev = self.rev or null;
        };
        kwasm-test = final.callPackage ./nix/kwasm/test.nix {
          inherit kwasm kwasm-pyk;
        };
      in {
        inherit kwasm kwasm-pyk kwasm-test;
      };
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          uvOverlay
          kOverlay
          kwasmOverlay
        ];
      };
      python = pkgs."python${pythonVer}";
    in {
      devShells.defualt = pkgs.mkShell {
        packages = with pkgs; [
          k
          python
          uv
          which
        ];
        env = {
          # prevent uv from managing Python downloads and force use of specific 
          UV_PYTHON_DOWNLOADS = "never";
          UV_PYTHON = python.interpreter;
        };
        shellHook = ''
          unset PYTHONPATH
        '' + pkgs.lib.strings.optionalString (pkgs.stdenv.isAarch64 && pkgs.stdenv.isDarwin) ''
          export APPLE_SILICON=true
        '';
      };
      packages = rec {
        inherit (pkgs) kwasm kwasm-pyk kwasm-test;
        default = kwasm;
      };
    }
  ) // {
    overlays.default = final: prev: {
      inherit (self.packages.${final.system}) kwasm;
    };
  };
}
