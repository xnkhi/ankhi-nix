{ config, pkgs, ... }:

let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
in
{

	programs.zsh = {

		history.size = 100;

		initContent  = ''
			autoload -Uz colors && colors
			bindkey "''${key[Up]}" up-line-or-search
			PS1="[%F{magenta}%n%f.%F{black}%m%f] %F{red}%~%f \ "
		'';

		shellAliases = {
			la      = "ls -a";
			ll      = "ls -l";
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

	programs.git = {
		userName    = "xnkhi";
		userEmail   = "git.chokehold749@passinbox.com";
	};

	programs.firefox = {
        enable = true;
        languagePacks = [ "de" "en-US" ];

        policies = {
            DisableTelemetry = true;
            DisableFirefoxStudies = true;
            EnableTrackingProtection = {
                Value= true;
                Locked = true;
                Cryptomining = true;
                Fingerprinting = true;
            };
            DisablePocket = true;
            DisableFirefoxAccounts = true;
            DisableAccounts = true;
            DisableFirefoxScreenshots = true;
            OverrideFirstRunPage = "";
            OverridePostUpdatePage = "";
            DontCheckDefaultBrowser = true;
            DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
            DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
            SearchBar = "unified"; # alternative: "separate"

            ExtensionSettings = {
                "uBlock0@raymondhill.net" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
                    installation_mode = "force_installed";
                };
            };

            Preferences = { 
                "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
                "extensions.pocket.enabled" = lock-false;
                "extensions.screenshots.disabled" = lock-true;
                "browser.topsites.contile.enabled" = lock-false;
                "browser.formfill.enable" = lock-false;
                "browser.search.suggest.enabled" = lock-false;
                "browser.search.suggest.enabled.private" = lock-false;
                "browser.urlbar.suggest.searches" = lock-false;
                "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
                "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
                "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
                "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
                "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
                "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
                "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
                "browser.newtabpage.activity-stream.showSponsored" = lock-false;
                "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
                "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
            };
        };
    };

}
