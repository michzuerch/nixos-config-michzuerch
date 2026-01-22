{
  lib,
  pkgs,
  ...
}: {
  programs.nvf.settings.vim = {
    diagnostics = {
      enable = true;
      config = {
        signs = {
          text = {
            "vim.diagnostic.severity.Error" = " ";
            "vim.diagnostic.severity.Warn" = " ";
            "vim.diagnostic.severity.Hint" = " ";
            "vim.diagnostic.severity.Info" = " ";
          };
        };
        underline = true;
        update_in_insert = true;
        virtual_text = {
          format =
            lib.generators.mkLuaInline
            /*
            lua
            */
            ''
              function(diagnostic)
                return string.format("%s", diagnostic.message)
                --return string.format("%s (%s)", diagnostic.message, diagnostic.source)
              end
            '';
        };
      };
      nvim-lint = {
        enable = true;
      };
    };
    syntaxHighlighting = true;
    treesitter = {
      enable = true;
      autotagHtml = true;
      context.enable = true;
      highlight.enable = true;
      grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        typescript # in language settings only tsx gets enabled, not typescript
      ];
    };
    lsp = {
      enable = true;
      trouble.enable = true;
      lspSignature.enable = true;
      lspconfig.enable = true;
      formatOnSave = true;
      inlayHints.enable = true;
      null-ls.enable = true;
      nvim-docs-view.enable = true;
      servers.nixd.settings.nil.nix.autoArchive = true;
      otter-nvim = {
        enable = true;
        setupOpts = {
          buffers.set_filetype = true;
          lsp = {
            diagnostic_update_event = [
              "BufWritePost"
              "InsertLeave"
            ];
          };
        };
      };
      lspkind.enable = true;
      lspsaga = {
        enable = true;
        setupOpts = {
          ui = {
            code_action = "";
          };
          lightbulb = {
            sign = false;
            virtual_text = true;
          };
          breadcrumbs.enable = false;
        };
      };
    };
    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };

    languages = {
      enableDAP = true;
      enableExtraDiagnostics = true;
      enableFormat = true;
      enableTreesitter = true;

      nix = {
        enable = true;
        extraDiagnostics = {
          enable = true;
          types = [
            "deadnix"
            "statix"
          ];
        };
        format = {
          enable = true;
          type = ["alejandra"];
        };
        lsp.enable = true;
        treesitter.enable = true;
      };
      astro = {
        enable = true;
        format = {
          # todo Add formatter for astro
          enable = true;
          type = ["prettier"];
        };
      };
      markdown = {
        enable = true;
        format.type = ["prettierd"];
        extensions = {
          markview-nvim = {
            enable = true;
          };
        };
        extraDiagnostics.enable = true;
      };
      ts = {
        enable = true;
        extensions.ts-error-translator.enable = true;
        extraDiagnostics = {
          enable = true;
          types = ["eslint_d"];
        };
        format = {
          enable = true;
          type = ["prettier"];
        };
        lsp = {
          enable = true;
          servers = ["denols"];
        };
      };
      css = {
        enable = true;
        format = {
          enable = true;
          type = ["prettier"];
        };
      };
      svelte = {
        enable = true;
        extraDiagnostics = {
          enable = true;
          types = ["eslint_d"];
        };
        format = {
          enable = true;
          type = ["prettier"];
        };
        lsp = {
          enable = true;
          servers = ["svelte"];
        };
      };
      bash = {
        enable = true;
        extraDiagnostics = {
          enable = true;
          types = ["shellcheck"];
        };
        format = {
          enable = true;
          type = ["shfmt"];
        };
      };
      tailwind = {
        enable = true;
        lsp = {
          enable = true;
          servers = ["tailwindcss"];
        };
      };
      json = {
        enable = true;
        format = {
          enable = true;
          type = ["jsonfmt"];
        };
      };
      yaml = {
        enable = true;
        lsp = {
          enable = true;
          servers = ["yaml-language-server"];
        };
      };
      rust = {
        enable = true;
        dap = {
          enable = true;
          adapter = "lldb-dap";
        };
        extensions = {
          crates-nvim = {
            enable = true;
            setupOpts = {
              completion = {
                crates = {
                  enabled = true;
                  max_results = 8;
                  min_chars = 3;
                  lsp = {
                    enabled = true;
                    completion = true;
                    actions = true;
                    hover = true;
                  };
                };
              };
            };
          };
        };
        format = {
          enable = true;
          type = ["rustfmt"];
        };
        lsp = {
          enable = true;
          opts = ''
            ['rust-analyzer'] = {
              cargo = {allFeature = true},
              checkOnSave = true,
              procMacro = {
                enable = true,
              },
            },
          '';
        };
      };
      lua = {
        enable = true;
        extraDiagnostics = {
          enable = true;
          types = ["luacheck"];
        };
        format = {
          enable = true;
          type = ["stylua"];
        };
        lsp = {
          enable = true;
          lazydev.enable = true;
          servers = ["lua-language-server"];
        };
      };
      html = {
        enable = true;
        extraDiagnostics = {
          enable = true;
          types = ["htmlhint"];
        };
        format = {
          enable = true;
          type = ["superhtml"];
        };
        lsp = {
          enable = true;
          servers = ["emmet-ls"];
        };
        treesitter = {
          enable = true;
          autotagHtml = true;
        };
      };
      go = {
        enable = true;
        dap.enable = true;
        format = {
          enable = true;
          type = ["gofmt"];
        };
        lsp.enable = true;
        treesitter.enable = true;
      };
      sql = {
        enable = true;
        extraDiagnostics = {
          enable = true;
          types = ["sqlfluff"];
        };
        format = {
          enable = true;
          type = ["sqlfluff"];
        };
        lsp = {
          enable = true;
          servers = ["sqls"];
        };
      };
    };
    formatter = {
      conform-nvim = {
        enable = true;
      };
    };
  };
}
