{
  programs.nvf.settings.vim = {
    undoFile.enable = true;

    assistant = {
      chatgpt.enable = false;
      copilot = {
        enable = false;
        cmp.enable = true;
      };
      codecompanion-nvim.enable = false;
      avante-nvim.enable = false;
    };
    statusline.lualine.enable = true;

    autocomplete = {
      nvim-cmp.enable = true;
      blink-cmp.enable = false;
    };

    ui = {
      borders.enable = true;
      noice.enable = true;
      colorizer.enable = true;
      modes-nvim.enable = true;
      illuminate.enable = true;
      nvim-ufo.enable = true;
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
          go = [
            "90"
            "130"
          ];
        };
      };
      fastaction.enable = true;
    };
    git = {
      enable = true;
      gitsigns.enable = true;
      gitsigns.codeActions.enable = false;
      neogit.enable = true;
    };
    terminal.toggleterm = {
      enable = true;
      lazygit = {
        enable = true;
        mappings.open = "<leader>gl";
      };
    };
    visuals = {
      rainbow-delimiters.enable = true;
      nvim-scrollbar.enable = false;
      nvim-web-devicons.enable = true;
      nvim-cursorline.enable = true;
      cinnamon-nvim.enable = true;
      fidget-nvim.enable = true;
      highlight-undo.enable = true;
      indent-blankline.enable = true;
    };
    autopairs.nvim-autopairs.enable = true;
    snippets.luasnip.enable = true;
    telescope.enable = true;
    filetree.neo-tree.enable = true;
    tabline.nvimBufferline.enable = true;
    treesitter = {
      context.enable = true;
      autotagHtml.enable = true;
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
      direnv.enable = true;
      diffview-nvim.enable = true;
      yazi-nvim.enable = true;
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
}
