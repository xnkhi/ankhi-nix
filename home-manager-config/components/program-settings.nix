{ config, pkgs, ... }:

{

	programs.zsh = {

		history.size = 100;

		initContent  = ''
			autoload -Uz colors && colors
			bindkey "''${key[Up]}" up-line-or-search
			PS1="[%F{magenta}%n%f.%F{black}%m%f] %F{blue}%~%f \ "
		'';

		shellAliases = {
			la      = "ls -a";
			ll      = "ls -l";
			cls     = "clear";
			v       = "nvim";
			sysup   = "sudo nixos-rebuild switch --flake ~/.system-dotfiles#notebook";
		};

		plugins = [
			{
				name = "zsh-autosuggestions";
				src = pkgs.fetchFromGitHub {
        			owner = "zsh-users";
        			repo = "zsh-autosuggestions";
        			rev = "v0.4.0";
        			sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
      			};
			}
		];

	};

	xdg.mimeApps = {
		enable = true;
		defaultApplications = {
			"inode/directory" = [ "org.xfce.thunar.desktop" ];
		};
	};

	programs.git = {
		userName    = "xnkhi";
		userEmail   = "git.chokehold749@passinbox.com";
	};

}
