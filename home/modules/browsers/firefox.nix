{
  pkgs,
  inputs,
  lib,
  ...
}: {
  programs.firefox = {
    enable = true;
    package = inputs.firefox.packages.x86_64-linux.firefox-devedition-bin;
    languagePacks = ["en-US" "de"];
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisableFormHistory = true;
      DisableFirefoxAccounts = true;
      NetworkPrediction = false;
      UserMessaging = {
        WhatsNew = false;
        UrlbarInterventions = false;
        FeatureRecommendations = false;
        MoreFromMozilla = false;
        SkipOnboarding = true;
      };
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      HardwareAcceleration = true;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      OfferToSaveLogins = false;
      # OfferToSaveLoginsDefault = false;
      PasswordManagerEnabled = false;
      FirefoxHome = {
        Search = true;
        Pocket = false;
        Snippets = false;
        TopSites = false;
        Highlights = false;
      };
    };
    profiles = {
      michzuerch = {
        #   id = 0;
        isDefault = true;
        name = "michzuerch";
        settings = {
          "beacon.enabled" = false;

          "browser.disableResetPrompt" = true;
          "browser.download.panel.shown" = true;
          "browser.feeds.showFirstRunUI" = false;
          "browser.messaging-system.whatsNewPanel.enabled" = false;
          "browser.rights.3.shown" = true;
          "browser.shell.checkDefaultBrowser" = false;
          "browser.shell.defaultBrowserCheckCount" = 1;
          "browser.startup.homepage_override.mstone" = "ignore";
          "browser.uitour.enabled" = false;
          "startup.homepage_override_url" = "";
          "trailhead.firstrun.didSeeAboutWelcome" = true;
          "browser.bookmarks.restore_default_bookmarks" = false;
          "browser.bookmarks.addedImportButton" = true;
          "browser.safebrowsing.malware.enabled" = false;
          "browser.search.hiddenOneOffs" = "Google,Yahoo,Bing,Amazon.com,Twitter";
          "browser.search.suggest.enabled" = false;
          "browser.send_pings" = false;

          # Don't ask for download dir
          "browser.download.useDownloadDir" = false;

          # Disable crappy home activity stream page
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false;
          "browser.newtabpage.blocked" = lib.genAttrs [
            # Youtube
            "26UbzFJ7qT9/4DhodHKA1Q=="
            # Facebook
            "4gPpjkxgZzXPVtuEoAL9Ig=="
            # Wikipedia
            "eV8/WsSLxHadrTL1gAxhug=="
            # Reddit
            "gLv0ja2RYVgxKdp0I5qwvA=="
            # Amazon
            "K00ILysCaEq8+bEqV/3nuw=="
            # Twitter
            "T9nJot5PurhJSy8n038xGA=="
          ] (_: 1);

          # Disable some telemetry
          "app.shield.optoutstudies.enabled" = false;
          "browser.discovery.enabled" = false;
          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "browser.ping-centre.telemetry" = false;
          "datareporting.healthreport.service.enabled" = false;
          "datareporting.healthreport.uploadEnabled" = false;
          "datareporting.policy.dataSubmissionEnabled" = false;
          "datareporting.sessions.current.clean" = true;
          "devtools.onboarding.telemetry.logged" = false;
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.hybridContent.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.prompted" = 2;
          "toolkit.telemetry.rejected" = true;
          "toolkit.telemetry.reportingpolicy.firstRun" = false;
          "toolkit.telemetry.server" = "";
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.unifiedIsOptIn" = false;
          "toolkit.telemetry.updatePing.enabled" = false;

          # Disable fx accounts
          "identity.fxaccounts.enabled" = false;
          # Disable "save password" prompt
          "signon.rememberSignons" = false;
          # Harden
          "privacy.trackingprotection.enabled" = true;
          "dom.security.https_only_mode" = true;
          # Layout
          "browser.uiCustomization.state" = builtins.toJSON {
            currentVersion = 20;
            newElementCount = 5;
            dirtyAreaCache = ["nav-bar" "PersonalToolbar" "toolbar-menubar" "TabsToolbar" "widget-overflow-fixed-list"];
            placements = {
              PersonalToolbar = ["personal-bookmarks"];
              TabsToolbar = ["tabbrowser-tabs" "new-tab-button" "alltabs-button"];
              nav-bar = ["back-button" "forward-button" "stop-reload-button" "urlbar-container" "downloads-button" "ublock0_raymondhill_net-browser-action" "_testpilot-containers-browser-action" "reset-pbm-toolbar-button" "unified-extensions-button"];
              toolbar-menubar = ["menubar-items"];
              unified-extensions-area = [];
              widget-overflow-fixed-list = [];
            };
            seen = ["save-to-pocket-button" "developer-button" "ublock0_raymondhill_net-browser-action" "_testpilot-containers-browser-action"];
          };

          "geo.enabled" = false;
          "gfx.webrender.all" = true;
          "layout.css.devPixelsPerPx" = 1;
          "media.navigator.enabled" = false;
          "media.video_stats.enabled" = false;
          "network.IDN_show_punycode" = true;
          "network.allow-experiments" = false;
          "network.dns.disablePrefetch" = true;
          "network.http.referer.XOriginPolicy" = 2;
          "network.http.referer.XOriginTrimmingPolicy" = 2;
          "network.http.referer.trimmingPolicy" = 1;
          "network.prefetch-next" = false;
          "permissions.default.shortcuts" = 2; # Don't steal my shortcuts!
          "privacy.donottrackheader.enabled" = true;
          "privacy.donottrackheader.value" = 1;
          "privacy.firstparty.isolate" = true;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "ui.textScaleFactor" = 100;
        };

        search = {
          force = true;
          default = "ddg";
          privateDefault = "ddg";
          engines = {
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "channel";
                      value = "unstable";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];

              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@np"];
            };
            "Nix Options" = {
              urls = [
                {
                  template = "https://search.nixos.org/options";
                  params = [
                    {
                      name = "channel";
                      value = "unstable";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];

              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@no"];
            };
            "NixOS Wiki" = {
              urls = [
                {
                  template = "https://wiki.nixos.org/w/index.php";
                  params = [
                    {
                      name = "search";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];

              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@nw"];
            };
            "Noogle" = {
              urls = [
                {
                  template = "https://noogle.dev?term={searchTerms}";
                }
              ];
              icon = "/share/icons/hicolor/scalable/apps/nix-snowflake-white.svg";
              definedAliases = ["@nog"];
            };
            bing.metadata.hidden = true;
          };
        };
        extensions = {
          packages = with pkgs.nur.repos.rycee.firefox-addons; [
            offline-qr-code-generator
            reddit-enhancement-suite
            ublock-origin
            wayback-machine
            vue-js-devtools
            rust-search-extension
            search-by-image
            proton-pass
            proton-vpn
            darkreader
            firefox-color
            about-sync
            header-editor
            print-to-pdf-document
            prometheus-formatter
            tomato-clock
            torrent-control
            unpaywall

            clearcache
            hacktools
            i-dont-care-about-cookies
            web-developer
          ];
          # settings = {
          #   "uBlock0@raymondhill.net" = {
          #     settings = {
          #       selectedFilterLists = [
          #         "ublock-filters"
          #         "ublock-privacy"
          #       ];
          #     };
          #     force = true;
          #   };
          # };
        };
      };
    };
  };

  home.sessionVariables = {
    DEFAULT_BROWSER = "${inputs.firefox.packages.x86_64-linux.firefox-devedition-bin}/bin/brave";
  };
}
