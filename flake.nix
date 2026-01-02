{
	description = "Home Flake";
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		aerothemeplasma = {
			url = "github:Rotlug/aerothemeplasma-nixos";
			inputs.nixpkgs.follows = "nixpkgs";
			flake = false;
		};
	};

	outputs = { self, nixpkgs, home-manager, aerothemeplasma, ... }: {
		nixosConfigurations.notebook = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./nixos-system-config/configuration.nix
				home-manager.nixosModules.home-manager {
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						backupFileExtension = "backup";
						sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
						users.ankhi.imports = [
							./home-manager-config/home.nix
						];
					};
				}
			];
			specialArgs = {
				inherit aerothemeplasma;
			};
		};
	};
}
