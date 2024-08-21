with import <nixpkgs> {};

let
  hello-go-nix = callPackage ./default.nix {};
in
mkShell {
  buildInputs = [ hello-go-nix ];
}
