{lib, ...}: {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
      command_timeout = 2000;
      palette = "catppuccin_mocha";
      palettes.catppuccin_mocha = {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
      };

      palettes.catppuccin_frappe = {
        rosewater = "#f2d5cf";
        flamingo = "#eebebe";
        pink = "#f4b8e4";
        mauve = "#ca9ee6";
        red = "#e78284";
        maroon = "#ea999c";
        peach = "#ef9f76";
        yellow = "#e5c890";
        green = "#a6d189";
        teal = "#81c8be";
        sky = "#99d1db";
        sapphire = "#85c1dc";
        blue = "#8caaee";
        lavender = "#babbf1";
        text = "#c6d0f5";
        subtext1 = "#b5bfe2";
        subtext0 = "#a5adce";
        overlay2 = "#949cbb";
        overlay1 = "#838ba7";
        overlay0 = "#737994";
        surface2 = "#626880";
        surface1 = "#51576d";
        surface0 = "#414559";
        base = "#303446";
        mantle = "#292c3c";
        crust = "#232634";
      };

      palettes.catppuccin_latte = {
        rosewater = "#dc8a78";
        flamingo = "#dd7878";
        pink = "#ea76cb";
        mauve = "#8839ef";
        red = "#d20f39";
        maroon = "#e64553";
        peach = "#fe640b";
        yellow = "#df8e1d";
        green = "#40a02b";
        teal = "#179299";
        sky = "#04a5e5";
        sapphire = "#209fb5";
        blue = "#1e66f5";
        lavender = "#7287fd";
        text = "#4c4f69";
        subtext1 = "#5c5f77";
        subtext0 = "#6c6f85";
        overlay2 = "#7c7f93";
        overlay1 = "#8c8fa1";
        overlay0 = "#9ca0b0";
        surface2 = "#acb0be";
        surface1 = "#bcc0cc";
        surface0 = "#ccd0da";
        base = "#eff1f5";
        mantle = "#e6e9ef";
        crust = "#dce0e8";
      };
      format = lib.concatStrings [
        "[ ](fg:red)"
        # "($container)"
        "$os"
        "$username"
        "[](bg:peach fg:red)"
        "$directory"
        "[](bg:yellow fg:peach)"
        "$git_branch"
        "$git_status"
        "$git_commit"
        "$git_metrics(fg:crust bg:yellow)"
        "[](fg:yellow bg:green)"
        "$lua"
        "$bun"
        "$nodejs"
        "$package"
        "$c"
        "$cpp"
        "$rust"
        "$golang"
        "$php"
        "$java"
        "$kotlin"
        "$haskell"
        "$python"
        "$terraform"
        "$docker_context"
        "$sudo"
        "$cmd_duration"
        "$fill"
        # "$jobs"
        "$status"
        # "$time"
        "$line_break"
        "$character"
      ];

      container = {
        format = "[$symbol]($style)";
        symbol = " ";
        style = "fg:color_text bg:color_lavender";
      };

      os = {
        format = "[$symbol]($style)";
        style = "fg:crust bg:red";
        disabled = false;
        symbols = {
          NixOS = "❄️ ";
        };
      };

      username = {
        style_user = "bg:red fg:crust";
        style_root = "bg:red fg:crust";
        format = "[$user]($style)";
        show_always = true;
        aliases = {
          michzuerch = "Michi";
        };
      };

      directory = {
        style = "bg:peach fg:crust";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = "󰝚 ";
          "Pictures" = " ";
          "Developer" = "󰲋 ";
        };
      };

      time = {
        disabled = false;
        style = "fg:color_fg0 bg:color_bg3";
        format = "[](fg:color_orange)[ ](bold fg:color_bg0 bg:color_orange)[ $time]($style)[](fg:color_bg3)";
      };

      env_var = {
        variable = "CONTAINER_ID";
        symbol = "📦 ";
        style = "color_rosewater";
        format = "running on: [$env_value]($style)";
      };

      status = {
        style = "fg:color_teal";
        symbol = "";
        success_symbol = "";
        format = "[$symbol $status]($style) ";
        disabled = false;
      };

      jobs = {
        symbol = "";
        style = "fg:color_fg0 bg:color_bg3";
        number_threshold = 1;
        format = "[$symbol]($style)";
      };

      nix_shell = {
        format = "[](fg:color_fg0 bg:color_bg3)[($name \\(develop\\) <- )$symbol]($style)[](fg:color_yellow)";
        impure_msg = "devbox";
        symbol = "  ";
        style = "bg:color_fg0 fg:color_bg3";
      };

      fill = {
        symbol = " ";
        disabled = false;
      };

      git_branch = {
        symbol = "";
        style = "bg:yellow";
        format = "[[ $symbol $branch ](fg:crust bg:yellow)]($style)";
        disabled = false;
      };

      git_status = {
        style = "bg:yellow";
        format = "[[($all_status$ahead_behind )](fg:crust bg:yellow)]($style)";
        disabled = false;
      };

      git_commit = {
        style = "fg:crust bg:yellow";
        commit_hash_length = 4;
        tag_symbol = "🔖 ";
        format = "[$hash]($style)";
        disabled = false;
      };

      git_metrics = {
        added_style = "fg:crust bg:yellow";
        deleted_style = "fg:crust bg:yellow";
        format = "[[+$added]($added_style)/[-$deleted]($deleted_style)](fg:crust bg:yellow)";
        disabled = false;
      };

      # git_commit = {
      #   format = "[$hash]($style)";
      #   style = "bg:color_bg3 fg:color_fg0";
      #   only_detached = true;
      #   tag_symbol = "🏷 ";
      # };
      # git_status = {
      #   conflicted = " 🏳";
      #   ahead = " 🏎💨";
      #   behind = " 😰";
      #   diverged = " 😵";
      #   up_to_date = " ✓";
      #   untracked = " 🤷";
      #   stashed = " 📦";
      #   modified = " 📝";
      #   staged = "[++\($count\)](fg:color_fg0 bg:color_bg3)";
      #   renamed = " 👅";
      #   deleted = " 🗑";
      #   format = "[[($all_status$ahead_behind) ](fg:color_fg0 bg:color_bg3)]($style)[ ](fg:color_bg3)";
      #   style = "bg:color_bg3";
      # };

      hostname = {
        format = "[$ssh_symbol]($style)[$hostname ]($style)";
        ssh_only = true;
        detect_env_vars = [''!TMUX''];
        style = "fg:color_base bg:color_lavender";
      };

      helm = {
        format = "via [⎈ $version](fg:color_text bg:color_mauve) ";
      };

      kubernetes = {
        format = "on [⛵ ($user on )($cluster in )$context \($namespace\)](dimmed green) ";
        disabled = false;
      };

      kubernetes.context_aliases = {
        "dev.local.cluster.k8s" = "dev";
        ".*/openshift-cluster/.*" = "openshift";
        "gke_.*_(?P<var_cluster>[\w-]+)" = "gke-$var_cluster";
      };

      kubernetes.user_aliases = {
        "dev.local.cluster.k8s" = "dev";
        "root/.*" = "root";
      };

      sudo = {
        style = "fg:color_fg0 bg:color_bg3";
        symbol = "🧙  ";
        disabled = true;
        format = "[ $symbol ](bg:color_bg3)[  ](fg:color_bg0 bg:color_purple)[ ](fg:color_purple)";
      };

      aws = {
        format = "[ ](fg:color_blue)[  ](bg:color_blue fg:color_bg0)[ $symbol ($profile)(\($region\)) ]($style)[ ](fg:color_bg3)";
        style = "bg:color_bg3 fg:color_fg0";
        symbol = "󰸏";
      };

      aws.region_aliases = {
        eu-west-2 = "eu-w2";
        eu-west-1 = "eu-w1";
      };

      cmd_duration = {
        min_time = 500;
        show_milliseconds = false;
        format = "[ ](bg:green)[   $duration](fg:crust bg:green)[ ](fg:green)";
        disabled = false;
      };

      lua = {
        symbol = " ";
        style = "bg:green";
        format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
      };

      bun = {
        symbol = " ";
        style = "bg:green";
        format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
      };

      nodejs = {
        symbol = " ";
        style = "bg:green";
        format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
      };

      package = {
        symbol = " ";
        style = "bg:green";
        format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
      };

      c = {
        symbol = " ";
        style = "bg:green";
        format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
      };

      cpp = {
        symbol = " ";
        style = "bg:green";
        format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:green";
        format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
      };

      golang = {
        symbol = "";
        style = "bg:green";
        format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
      };

      php = {
        symbol = "";
        style = "bg:green";
        format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
      };

      java = {
        symbol = " ";
        style = "bg:green";
        format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
      };

      kotlin = {
        symbol = "";
        style = "bg:green";
        format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
      };

      haskell = {
        symbol = "";
        style = "bg:green";
        format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
      };

      python = {
        symbol = "";
        style = "bg:green";
        format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
      };

      terraform = {
        symbol = " ";
        style = "bg:green";
        format = "[[ $symbol( $version$workspace)]](fg:crust bg:green)]($style)";
      };

      docker_context = {
        symbol = "";
        style = "bg:sapphire";
        format = "[[ $symbol( $context) ](fg:crust bg:sapphire)]($style)";
      };

      line_break = {
        disabled = false;
      };

      character = {
        success_symbol = "[ 󱞩 ](bold green)";
        error_symbol = "[ 󱞩 ](bold red)";
        vimcmd_symbol = "[ ](bold purple)";
        vimcmd_replace_symbol = "[ ](bold green)";
        vimcmd_replace_one_symbol = "[ ](bold green)";
        vimcmd_visual_symbol = "[ ](bold yellow)";
      };
    };
  };
}
