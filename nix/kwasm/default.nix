{
  lib,
  stdenv,
  makeWrapper,
  callPackage,

  k,
  which,

  kwasm-pyk,
  rev ? null
}:

stdenv.mkDerivation {
  pname = "kwasm";
  version = if (rev != null) then rev else "dirty";
  nativeBuildInputs = [
    k
    kwasm-pyk
    makeWrapper
  ];

  src = callPackage ../kwasm-source { };

  enableParallelBuilding = true;

  buildPhase = ''
    export XDG_CACHE_HOME=$(pwd)
    kwasm-kdist -v build -j4
  '';

  installPhase = ''
    mkdir -p $out
    cp -r ./kdist-*/* $out/
    mkdir -p $out/bin
    makeWrapper ${kwasm-pyk}/bin/kwasm $out/bin/kwasm \
      --prefix PATH : ${lib.makeBinPath [ which k ]} \
      --set KDIST_DIR $out
  '';
}
