{

	description = "Home Flake";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... }: {
		nixosConfigurations.notebook = nixpkgs.lib.nixosSystem {

			system = "x86_64-linux";
			modules = [
				./nixos-system-config/configuration.nix
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

			nixpkgs.overlays = [
				(self: super: {
					niri = super.callPackage ./nixos-system-config/components/assets/custom-packages/niri-blur {};
				})
			];
		};
	};

}
