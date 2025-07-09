{pkgs, ...}: {
  programs.nvf = {
    enable = true;
    enableManpages = true;
    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
          transparent = false;
        };
        debugMode = {
          enable = false;
          level = 16;
          logFile = "/tmp/nvim.log";
        };

        spellcheck = {
          enable = true;
          programmingWordlist.enable = true;
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

          nix.enable = true;
          markdown.enable = true;

          bash.enable = true;
          css.enable = true;
          ts.enable = true;
          astro.enable = true;
          tailwind.enable = true;
          svelte.enable = true;
          rust = {
            enable = true;
            crates.enable = true;
          };
          lua.enable = true;
          html.enable = true;
          go.enable = true;
          sql.enable = true;
        };

        visuals = {
          nvim-scrollerbar.enable = true;
          nvim-web-devicons.enable = true;
          nvim-cursorline.enable = true;
          cinnamon.enable = true;
          fidget-nvim.enable = true;
          highlight-undo.enable = true;
          indent-blankline.enable = true;
        };

        statusline = {
          lualine = {
            enable = true;
            theme = "gruvbox";
          };
        };

        autopairs.nvim-autopair.enable = true;

        autocomplete = {
          nvim-cmp.enable = false;
          blink-cmp.enable = true;
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
      };
    };
  };
}
