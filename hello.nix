{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "hello-nix";
  src = ./.;
  buildInputs = [ pkgs.cowsay ];

  buildPhase = ''
    echo '${pkgs.cowsay}/bin/cowsay "Hello, Nix!"' > hello.sh
    chmod +x hello.sh
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp hello.sh $out/bin/hello-nix
  '';

  # Make sure cowsay is available at runtime
  nativeBuildInputs = [ pkgs.makeWrapper ];
  fixupPhase = ''
    wrapProgram $out/bin/hello-nix \
      --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.cowsay ]}
  '';
}
