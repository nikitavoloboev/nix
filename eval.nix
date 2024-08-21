let
  pkgs = import <nixpkgs> {};
  myFunction = import ./try.nix;
  result = myFunction { inherit pkgs; };
in
{
  name = result.name;
  pname = result.pname;
  version = result.version;
  meta = result.meta;
}
