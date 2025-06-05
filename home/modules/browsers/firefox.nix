{
  pkgs,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;
    package = inputs.firefox.packages.${pkgs.system}.firefox-devedition-bin;
    languagePacks = ["en-US" "de"];
    policies = {
      # ExtensionSettings = {
      # };
      DisableTelemetry = true;
      DisablePocket = true;
      DisableFirefoxStudies = true;
      DisableFormHistory = true;
      DisableFirefoxAccounts = true;
      NetworkPrediction = false;
      NoDefaultBookmarks = true;
      FirefoxHome = {
        Search = true;
        Pocket = false;
        Snippets = false;
        TopSites = false;
        Highlights = false;
      };
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
    };
    profiles = {
      michzuerch = {
        id = 0;
        isDefault = true;
        name = "michzuerch";
        settings = {
          "app.update.auto" = false;
          "beacon.enabled" = false;

          "browser.safebrowsing.malware.enabled" = false;
          "browser.search.hiddenOneOffs" = "Google,Yahoo,Bing,Amazon.com,Twitter";
          "browser.search.suggest.enabled" = false;
          "browser.send_pings" = false;
          "browser.download.panel.shown" = true;
          "browser.discovery.enabled" = false;

          "extensions.autoDisableScopes" = 0;
          "extensions.getAddons.showPane" = false;
          "extensions.htmlaboutaddons.recommendations.enabled" = false;

          # Auto-decline cookies
          "cookiebanners.bannerClicking.enabled" = true;
          "cookiebanners.service.mode" = 1;
          "cookiebanners.service.mode.privateBrowsing" = 1;

          # Tracking
          "browser.contentblocking.category" = "strict";
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.pbmode.enabled" = true;
          "privacy.trackingprotection.emailtracking.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
          "privacy.trackingprotection.cryptomining.enabled" = true;
          "privacy.trackingprotection.fingerprinting.enabled" = true;

          "dom.security.https_only_mode" = true;
          "identity.fxaccounts.enabled" = false;
          "signon.rememberSignons" = false;
          "geo.enabled" = false;
          "gfx.webrender.all" = true;
          "general.smoothScroll" = true;
          "layout.css.devPixelsPerPx" = 1;
          "media.navigator.enabled" = false;
          "media.video_stats.enabled" = false;
          # Fingerprinting
          "privacy.fingerprintingProtection" = true;
          "privacy.resistFingerprinting" = true;
          "privacy.resistFingerprinting.pbmode" = true;

          # Query Tracking
          "privacy.query_stripping.enabled" = true;
          "privacy.query_stripping.enabled.pbmode" = true;
          "privacy.donottrackheader.enabled" = true;
          "privacy.donottrackheader.value" = 1;
          "privacy.firstparty.isolate" = true;

          # Phishing
          # Disables cross-origin sub-resources from opening HTTP authentication credentials dialogs
          "network.auth.subresource-http-auth-allow" = 1;

          "network.IDN_show_punycode" = true;
          "network.allow-experiments" = false;
          "network.dns.disablePrefetch" = true;
          "network.http.referer.XOriginPolicy" = 2;
          "network.http.referer.XOriginTrimmingPolicy" = 2;
          "network.http.referer.trimmingPolicy" = 1;
          "network.prefetch-next" = false;

          "permissions.default.shortcuts" = 2; # Don't steal my shortcuts!

          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "ui.textScaleFactor" = 100;
          "widget.dmabuf.force-enabled" = true;
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
          };
        };
        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
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
      };
    };
  };
}
