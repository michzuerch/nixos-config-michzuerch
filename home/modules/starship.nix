{lib, ...}: {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
      scan_timeout = 50;
      command_timeout = 2000;
      format = lib.concatStrings [
        # "($container)"
        "[❄️ ](fg:#3B76F0)"
        "$directory"
        "[](fg:#3B76F0)"
        "$symbol($git_branch[](fg:#FCF392))"
        "$symbol( $git_commit$git_status$git_metrics$git_state)"
        "$fill"
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
        format = "[$symbol]";
        symbol = "  ";
      };

      directory = {
        format = "[$path $read_only]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        fish_style_pwd_dir_length = 0;
        use_logical_path = true;
        use_os_path_sep = true;
        # style = "fg:text bg:#3B76F0";
        style = "bg:#3B76F0 fg:#FCF392";
        home_symbol = " ";
        read_only = "";
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = "󰝚 ";
          "Pictures" = " ";
          "Developer" = "󰲋 ";
        };
      };

      status = {
        symbol = " ";
        success_symbol = " ";
        not_executable_symbol = "🚫 ";
        format = "$symbol $status($style)";
        # style = "bg:blue";
        map_symbol = true;
        disabled = false;
      };

      fill = {
        symbol = " ";
        disabled = false;
      };

      git_branch = {
        symbol = " ";
        format = "[  $symbol$branch(:$remote_branch) ]($style)";
        style = "fg:#1C3A5E bg:#FCF392";
        disabled = false;
      };

      git_status = {
        format = "($all_status$ahead_behind )";
        disabled = false;
      };

      git_metrics = {
        added_style = "bold blue";
        format = "[+$added]($added_style)/[-$deleted]($deleted_style) ";
        disabled = false;
      };

      hostname = {
        format = "$ssh_symbol$hostname";
        ssh_only = true;
        detect_env_vars = [''!TMUX''];
      };

      helm = {
        format = "via ⎈ $version";
      };

      kubernetes = {
        format = "on [⛵ ($user on )($cluster in )$context \($namespace\)]";
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
        symbol = "🧙  ";
        disabled = false;
        format = "$symbol";
      };

      aws = {
        format = "  $symbol ($profile)(\($region\))";
        symbol = "󰸏";
      };

      aws.region_aliases = {
        eu-west-2 = "eu-w2";
        eu-west-1 = "eu-w1";
      };

      cmd_duration = {
        show_milliseconds = true;
        format = "  $duration ";
        style = "bg:cyan";
        disabled = false;
        show_notifications = false;
        min_time_to_notify = 45000;
      };

      lua = {
        symbol = " ";
        format = "$symbol( $version)";
      };

      bun = {
        symbol = " ";
        format = "$symbol( $version)";
      };

      nodejs = {
        symbol = " ";
        format = "$symbol( $version)";
      };

      package = {
        symbol = " ";
        format = "$symbol( $version)";
        display_private = true;
      };

      c = {
        symbol = " ";
        format = "$symbol( $version)";
      };

      cpp = {
        symbol = " ";
        format = "$symbol( $version)";
      };

      rust = {
        symbol = " ";
        format = "$symbol( $version)";
      };

      golang = {
        symbol = " ";
        format = "$symbol( $version)";
      };

      php = {
        symbol = " ";
        format = "$symbol( $version)";
      };

      java = {
        symbol = " ";
        format = "$symbol( $version)";
      };

      kotlin = {
        symbol = " ";
        format = "$symbol( $version)";
      };

      haskell = {
        symbol = " ";
        format = "$symbol( $version)";
      };

      python = {
        symbol = " ";
        format = "$symbol( $version)";
      };

      terraform = {
        symbol = " ";
        format = "$symbol( $version$workspace)";
      };

      docker_context = {
        symbol = " ";
        format = "$symbol( $context)";
      };

      line_break = {
        disabled = false;
      };

      character = {
        success_symbol = "󱞩";
        error_symbol = "󱞩";
        vimcmd_symbol = "";
        vimcmd_replace_symbol = "";
        vimcmd_replace_one_symbol = "";
        vimcmd_visual_symbol = "";
      };
    };
  };
}
