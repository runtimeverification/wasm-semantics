{
  description = "pykwasm - ";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
    uv2nix.url = "github:pyproject-nix/uv2nix/680e2f8e637bc79b84268949d2f2b2f5e5f1d81c";
    # stale nixpkgs is missing the alias `lib.match` -> `builtins.match`
    # therefore point uv2nix to a patched nixpkgs, which introduces this alias
    # this is a temporary solution until nixpkgs us up-to-date again
    uv2nix.inputs.nixpkgs.url = "github:runtimeverification/nixpkgs/libmatch";
    # inputs.nixpkgs.follows = "nixpkgs";
    pyproject-build-systems.url = "github:pyproject-nix/build-system-pkgs/7dba6dbc73120e15b558754c26024f6c93015dd7";
    pyproject-build-systems = {
      inputs.nixpkgs.follows = "uv2nix/nixpkgs";
      inputs.uv2nix.follows = "uv2nix";
      inputs.pyproject-nix.follows = "uv2nix/pyproject-nix";
    };
    pyproject-nix.follows = "uv2nix/pyproject-nix";
  };
  outputs = { self, nixpkgs, flake-utils, pyproject-nix, pyproject-build-systems, uv2nix }:
  let
    pythonVer = "310";
  in flake-utils.lib.eachSystem [
      "x86_64-linux"
      "x86_64-darwin"
      "aarch64-linux"
      "aarch64-darwin"
    ] (system:
    let
      # due to the nixpkgs that we use in this flake being outdated, uv is also heavily outdated
      # we can instead use the binary release of uv provided by uv2nix for now
      uvOverlay = final: prev: {
        uv = uv2nix.packages.${final.system}.uv-bin;
      };
      pykwasmOverlay = final: prev: {
        pykwasm = final.callPackage ./nix/pykwasm {
          inherit pyproject-nix pyproject-build-systems uv2nix;
          python = final."python${pythonVer}";
        };
      };
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          uvOverlay
          pykwasmOverlay
        ];
      };
      python = pkgs."python${pythonVer}";
    in {
      devShells.default = pkgs.mkShell {
        name = "uv develop shell";
        buildInputs = [
          python
          pkgs.uv
        ];
        env = {
          # prevent uv from managing Python downloads and force use of specific 
          UV_PYTHON_DOWNLOADS = "never";
          UV_PYTHON = python.interpreter;
        };
        shellHook = ''
          unset PYTHONPATH
        '';
      };
      packages = rec {
        inherit (pkgs) pykwasm;
        default = pykwasm;
      };
    }) // {
      overlays.default = final: prev: {
        inherit (self.packages.${final.system}) pykwasm;
      };
    };
}
