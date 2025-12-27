_: {
  programs.nvf = {
    enable = true;
    enableManpages = true;
    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;
        debugMode = {
          enable = false;
          level = 16;
          logFile = "/tmp/nvim.log";
        };

        spellcheck = {
          enable = false;
          programmingWordlist.enable = false;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
          lspkind.enable = true;
          lightbulb.enable = true;
          lspsaga.enable = true;
          trouble.enable = true;
          lspSignature.enable = true;
          otter-nvim.enable = true;
          nvim-docs-view.enable = true;
        };

        debugger = {
          nvim-dap = {
            enable = true;
            ui.enable = true;
          };
        };

        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;
          nix = {
            enable = true;
            extraDiagnostics = {
              enable = true;
              types = ["deadnix" "statix"];
            };
            format = {
              enable = true;
              type = ["alejandra"];
            };
            lsp.enable = true;
            treesitter.enable = true;
          };
          markdown = {
            enable = true;
            extensions.markview-nvim.enable = true;
            format = {
              enable = true;
              type = ["deno_fmt"];
            };
            lsp.enable = true;
            treesitter.enable = true;
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
            lsp.enable = true;
            treesitter.enable = true;
          };
          css = {
            enable = true;
            format = {
              enable = true;
              type = ["prettier"];
            };
            lsp.enable = true;
            treesitter.enable = true;
          };
          ts = {
            enable = true;
            extensions = {
              ts-error-translator.enable = true;
            };
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
            treesitter.enable = true;
          };
          astro = {
            enable = true;
            format = {
              # todo Add formatter for astro
              enable = false;
              type = ["prettier"];
            };
            lsp.enable = true;
            treesitter.enable = true;
          };
          tailwind = {
            enable = true;
            lsp = {
              enable = true;
              servers = ["tailwindcss"];
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
            treesitter.enable = true;
          };
          json = {
            enable = true;
            format = {
              enable = true;
              type = ["jsonfmt"];
            };
            lsp.enable = true;
            treesitter.enable = true;
          };
          yaml = {
            enable = true;
            lsp = {
              enable = true;
              servers = ["yaml-language-server"];
            };
            treesitter.enable = true;
          };
          rust = {
            enable = true;
            dap = {
              enable = true;
              adapter = "codelldb";
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
                      # lsp = {
                      #   enabled = true;
                      #   completion = true;
                      #   actions = true;
                      #   hover = true;
                      # };
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
            treesitter.enable = true;
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
            treesitter.enable = true;
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
            treesitter.enable = true;
          };
        };
        visuals = {
          nvim-scrollbar.enable = true;
          nvim-web-devicons.enable = true;
          nvim-cursorline.enable = true;
          cinnamon-nvim.enable = true;
          fidget-nvim.enable = true;
          highlight-undo.enable = true;
          indent-blankline.enable = true;
        };
        statusline = {
          lualine = {
            enable = true;
          };
        };
        autopairs.nvim-autopairs.enable = true;
        autocomplete = {
          nvim-cmp.enable = true;
          blink-cmp.enable = false;
        };
        snippets.luasnip.enable = true;
        filetree = {
          neo-tree = {
            enable = true;
          };
        };
        tabline = {
          nvimBufferline.enable = true;
        };
        treesitter.context.enable = true;
        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
          hardtime-nvim.enable = false;
        };
        telescope.enable = true;
        git = {
          enable = true;
          gitsigns.enable = true;
          gitsigns.codeActions.enable = false;
          neogit.enable = true;
        };
        minimap = {
          minimap-vim.enable = false;
          codewindow.enable = true;
        };
        dashboard = {
          dashboard-nvim.enable = false;
          alpha.enable = true;
        };
        notify = {
          nvim-notify.enable = true;
        };
        projects = {
          project-nvim.enable = true;
        };
        utility = {
          oil-nvim = {
            enable = true;
            gitStatus.enable = true;
          };
          ccc.enable = true;
          vim-wakatime.enable = false;

          diffview-nvim.enable = true;
          yanky-nvim = {
            enable = true;
            setupOpts.ring.storage = "memory";
          };
          icon-picker.enable = true;
          surround.enable = true;
          leetcode-nvim.enable = false;
          multicursors.enable = true;
          smart-splits.enable = true;
          motion = {
            hop.enable = false;
            leap.enable = false;
            precognition.enable = false;
          };
          images = {
            image-nvim.enable = true;
            img-clip.enable = true;
          };
        };
        notes = {
          obsidian.enable = false;
          neorg.enable = false;
          orgmode.enable = false;
          mind-nvim.enable = true;
          todo-comments.enable = true;
        };
        terminal = {
          toggleterm = {
            enable = true;
            lazygit.enable = true;
          };
        };
        ui = {
          borders.enable = true;
          noice.enable = true;
          colorizer.enable = true;
          modes-nvim.enable = true;
          illuminate.enable = true;
          breadcrumbs = {
            enable = true;
            navbuddy.enable = true;
          };
          smartcolumn = {
            enable = true;
            setupOpts.custom_colorcolumn = {
              nix = "110";
              ruby = "120";
              java = "130";
              go = ["90" "130"];
            };
          };
          fastaction.enable = true;
        };
        assistant = {
          chatgpt.enable = false;
          copilot = {
            enable = false;
            cmp.enable = true;
          };
          codecompanion-nvim.enable = false;
          avante-nvim.enable = false;
        };
        session = {
          nvim-session-manager.enable = true;
        };
        gestures = {
          gesture-nvim.enable = false;
        };
        comments = {
          comment-nvim.enable = true;
        };
        presence = {
          neocord.enable = false;
        };
      };
    };
  };
}
