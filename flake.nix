{
  description = "NixOS server flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        utils.follows = "flake-utils";
      };
    };
  };

  outputs = { self, nixpkgs, flake-utils, deploy-rs }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = with pkgs; mkShell { };
        packages = { httpServer = pkgs.callPackage ./go { }; };
        deploy.nodes.nixos = {
          hostname = "51.250.36.50";
          profiles.system = {
            sshUser = "root";
            user = "root";
            path = deploy-rs.lib.x86_64-linux.activate.nixos
              self.nixosConfigurations.nixos;
            fastConnection = true;
          };
        };
      }) // {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          modules = [
            ./yandex.nix
            ({ pkgs, ... }: {
              programs.screen.enable = true;
              environment.systemPackages = [
                pkgs.neovim
                (pkgs.python3Full.withPackages (ps: [ ps.pip ]))
              ];
              networking.firewall.allowedTCPPorts = [ 8080 ];
              systemd.services = {
                httpServer = {
                  path = [ self.packages.${system}.httpServer ];
                  script = ''
                    hello-go-nix
                  '';
                  wantedBy = [ "multi-user.target" ];
                };
              };

            })

          ];
        };

      };
}

