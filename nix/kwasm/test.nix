{
  stdenv,
  callPackage,

  which,
  git,

  kwasm,
  kwasm-pyk,
  rev ? null
}:

stdenv.mkDerivation {
  pname = "kwasm-test";
  version = if (rev != null) then rev else "dirty";

  src = callPackage ../kwasm-source { };

  nativeBuildInputs = [
    kwasm
    which
    git
  ]; # kwasm-pyk?

  patchPhase = ''
    runHook prePatch
    # the nix derivation uses the kwasm binary instead of `uv --directory pykwasm run -- kwasm`, which changes directory
    # therefore replace '../$<' with '$<'
    substituteInPlace Makefile                                         \
      --replace-fail '$(TEST)'        '${kwasm}/bin/kwasm'             \
      --replace-fail '$(KDIST)'       '${kwasm-pyk}/bin/kwasm-kdist'   \
      --replace-fail '$(SOURCE_DIR)'  '${kwasm}/wasm-semantics/source'
    runHook postPatch
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
}
