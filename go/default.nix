{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  pname = "hello-go-nix";
  version = "0.1.0";
  src = ./.;

  nativeBuildInputs = [ pkgs.go ];

  buildPhase = ''
    export GOCACHE=$TMPDIR/go-cache
    export GOPATH=$TMPDIR/go
    export GO111MODULE=off
    mkdir -p $GOPATH/src/${pname}
    cp $src/main.go $GOPATH/src/${pname}/
    cd $GOPATH/src/${pname}
    go build -o ${pname}
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp $GOPATH/src/${pname}/${pname} $out/bin/
  '';

  meta = with pkgs.lib; {
    description = "A simple Go CLI application built with Nix";
    homepage = "https://example.com/hello-go-nix";
    license = licenses.mit;
    maintainers = [ ];
    platforms = platforms.all;
  };
}
