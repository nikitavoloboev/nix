{ pkgs ? import <nixpkgs> {} }:

let
  lib = pkgs.lib;
in
pkgs.stdenv.mkDerivation rec {
  pname = "hello-nix";
  version = "0.1.0";
  name = "${pname}-${version}";

  src = ./.;

  buildInputs = [ pkgs.cowsay ];
  nativeBuildInputs = [ pkgs.makeWrapper ];

  # Example of using a configuration file
  configFile = pkgs.writeText "hello-config.json" ''
    {
      "greeting": "Hello, Nix!"
    }
  '';

  buildPhase = ''
    echo '#!${pkgs.bash}/bin/bash' > hello.sh
    echo '${pkgs.cowsay}/bin/cowsay "$(${pkgs.jq}/bin/jq -r .greeting ${configFile})"' >> hello.sh
    chmod +x hello.sh
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp hello.sh $out/bin/${pname}
  '';

  fixupPhase = ''
    wrapProgram $out/bin/${pname} \
      --prefix PATH : ${lib.makeBinPath [ pkgs.cowsay pkgs.jq ]}
  '';

  meta = with lib; {
    description = "A simple Nix package that says hello using cowsay";
    homepage = "https://example.com/${pname}";
    license = licenses.mit;
    platforms = platforms.unix;
    maintainers = with maintainers; [ /* your name here */ ];
  };
}
