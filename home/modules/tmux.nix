{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    aggressiveResize = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    historyLimit = 10000;
    clock24 = true;
    shortcut = "a";
    baseIndex = 1;
    newSession = true;
    escapeTime = 0;
    secureSocket = false;
    keyMode = "vi";
    mouse = true;
    sensibleOnTop = true;
    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.resurrect
      tmuxPlugins.net-speed
      tmuxPlugins.catppuccin
      tmuxPlugins.sensible
      tmuxPlugins.continuum
      tmuxPlugins.yank
      # tmuxPlugins.tmux-fzf
    ];
    extraConfig = ''
      set -g detach-on-destroy off
      # automatically renumber tmux windows
      set -g renumber-windows on

      # make window/pane index start with 1
      setw -g pane-base-index 1

      # Activity Monitoring
      setw -g monitor-activity off
      set -g visual-activity off

      set -g @resurrect-strategy-vim 'session'
      set -g @resurrect-strategy-nvim 'session'
      set -g @resurrect-capture-pane-contents 'on'

      set -g @continuum-restore 'on'
      set -g @continuum-boot 'on'
      set -g @continuum-save-interval '10'
      set-environment -g COLORTERM "truecolor"
      set-option -g mouse on

      # pane movement shortcuts
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # easy-to-remember split pane commands
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      # Remap x to avoid confirmation to kill pane
      bind-key x kill-pane

      # Move windows
      bind-key S-Left swap-window -t -1\; select-window -t -1
      bind-key S-Right swap-window -t +1\; select-window -t +1
    '';
  };

  home.packages = with pkgs; [byobu];
}
