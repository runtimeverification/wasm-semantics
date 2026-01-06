{
  description = "K Semantics of WebAssembly";

  inputs = {
    rv-nix-tools.url = "github:runtimeverification/rv-nix-tools/854d4f05ea78547d46e807b414faad64cea10ae4";
    nixpkgs.follows = "rv-nix-tools/nixpkgs";

    k-framework.url = "github:runtimeverification/k/v7.1.310";
    k-framework.inputs.nixpkgs.follows = "nixpkgs";

    flake-utils.follows = "k-framework/flake-utils";

    uv2nix.url = "github:pyproject-nix/uv2nix/4cca323a547a1aaa9b94929c4901bed5343eafe8";
    # uv2nix requires a newer version of nixpkgs
    # therefore, we pin uv2nix specifically to a newer version of nixpkgs
    # until we replaced our stale version of nixpkgs with an upstream one as well
    # but also uv2nix requires us to call it with `callPackage`, so we add stuff
    # from the newer nixpkgs to our stale nixpkgs via an overlay
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    uv2nix.inputs.nixpkgs.follows = "nixpkgs-unstable";
    # uv2nix.inputs.nixpkgs.follows = "nixpkgs";
    pyproject-build-systems.url = "github:pyproject-nix/build-system-pkgs/042904167604c681a090c07eb6967b4dd4dae88c";
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
      nixpkgs-unstable,
      ... }:
  let
    pythonVer = "310";
  in flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
      };
      # for uv2nix, remove this once we updated to a newer version of nixpkgs
      staleNixpkgsOverlay = final: prev: {
        inherit (pkgs-unstable) replaceVars;
      };
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
          staleNixpkgsOverlay
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
