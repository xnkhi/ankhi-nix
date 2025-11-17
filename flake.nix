{
	description = "Home Flake";
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-25.05";
		nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }: {
		nixosConfigurations.notebook = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./nixos-system-config/configuration.nix
				{_module.args.unstable = nixpkgs-unstable.legacyPackages.x86_64-linux; }
				home-manager.nixosModules.home-manager {
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						backupFileExtension = "backup";
						users.ankhi.imports = [
							./home-manager-config/home.nix
						];
					};
				}
			];
		};
	};
}
