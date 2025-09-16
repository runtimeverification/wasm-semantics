{
  lib,
  nix-gitignore,
  stdenvNoCC,
}:
let
  kwasm-root-source = lib.cleanSource (nix-gitignore.gitignoreSourcePure [
      ../../.gitignore
      ".github/"
      "result*"
      "*.nix"
      "flake.lock"
      "/deps/"
      # include other directories with their own `.gitingore` individually
      "pykwasm/"
      # do not include submodule directories that might be initialized empty or non-existent
    ] ../../.
  );
  kwasm-pyk-source = lib.cleanSource (nix-gitignore.gitignoreSourcePure [
      ../../pykwasm/.gitignore
      # do not include submodule directories that might be initialized empty or non-existent
    ] ../../pykwasm/.
  );
in stdenvNoCC.mkDerivation {
  name = "kwasm-source";

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    mkdir -p $out
    cp -r ${kwasm-root-source}/. $out/
    cp -r ${kwasm-pyk-source}/. $out/pykwasm/
  '';
}
