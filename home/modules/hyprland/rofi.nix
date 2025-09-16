{pkgs, ...}: let
  colors = {
    scheme = "Tokyo Night Terminal Dark";
    author = "Michaël Ball";

    background = "16161E";
    mantle = "1A1B26";
    grey-dark = "2F3549";
    grey = "444B6A";
    grey-light = "787C99";
    text = "787C99";
    primary-pale = "CBCCD1";
    highlight = "D5D6DB";
    error = "F7768E";
    success = "FF9E64";
    yellow = "E0AF68";
    secondary = "41A6B5";
    info = "7DCFFF";
    primary = "7AA2F7";
    warning = "BB9AF7";
    purple = "D18616";
  };
in {
  xdg.configFile."rofi/config.rasi".text = ''

    /**
     * User: deadguy
     * Copyright: deadguy
     */

    configuration {
    	display-drun:    "Activate";
    	display-run:     "Execute";
    	display-window:  "Window";
    	show-icons:      true;
    	sidebar-mode:    true;
    }

    * {
    	background-color:            #080808;
    	text-color:                  #d3d7cf;
    	selbg:                       #215d9c;
    	actbg:                       #262626;
    	urgbg:                       #e53935;
    	winbg:			     #26c6da;

    	selected-normal-foreground:  @winbg;
    	normal-foreground:           @text-color;
    	selected-normal-background:  @actbg;
    	normal-background:           @background-color;

    	selected-urgent-foreground:  @background-color;
    	urgent-foreground:           @text-color;
    	selected-urgent-background:  @urgbg;
    	urgent-background:           @background-color;

    	selected-active-foreground:  @winbg;
    	active-foreground:           @text-color;
    	selected-active-background:  @actbg;
    	active-background:           @selbg;

    	line-margin:                 2;
    	line-padding:                2;
    	separator-style:             "none";
    	hide-scrollbar:              "true";
    	margin:                      0;
    	padding:                     0;
    }

    window {
    	location:	 west;
    	anchor:		 west;
    	height:		 100%;
    	width:		 22%;
    	orientation: horizontal;
    	children:	 [mainbox];
    }

    mainbox {
    	spacing:  0.8em;
    	children: [ entry,listview,mode-switcher ];
    }

    button { padding: 5px 2px; }

    button selected {
    	background-color: @active-background;
    	text-color:       @background-color;
    }

    inputbar {
    	padding: 5px;
    	spacing: 5px;
    }

    listview {
    	spacing: 0.5em;
    	dynamic: false;
    	cycle:   true;
    }

    element { padding: 10px; }

    entry {
    	expand:         false;
    	text-color:     @normal-foreground;
    	vertical-align: 1;
    	padding:        5px;
    }

    element normal.normal {
    	background-color: @normal-background;
    	text-color:       @normal-foreground;
    }

    element normal.urgent {
    	background-color: @urgent-background;
    	text-color:       @urgent-foreground;
    }

    element normal.active {
    	background-color: @active-background;
    	text-color:       @active-foreground;
    }

    element selected.normal {
    	background-color: @selected-normal-background;
    	text-color:       @selected-normal-foreground;
    	border:           0 5px solid 0 0;
    	border-color:	    @active-background;
    }

    element selected.urgent {
    	background-color: @selected-urgent-background;
    	text-color:       @selected-urgent-foreground;
    }

    element selected.active {
    	background-color: @selected-active-background;
    	text-color:       @selected-active-foreground;
    }

    element alternate.normal {
    	background-color: @normal-background;
    	text-color:       @normal-foreground;
    }

    element alternate.urgent {
    	background-color: @urgent-background;
    	text-color:       @urgent-foreground;
    }

    element alternate.active {
    	background-color: @active-background;
    	text-color:       @active-foreground;
    }
  '';

  #   xdg.configFile."rofi/config.rasi".text = ''
  #     /*****----- Configuration -----*****/
  #     configuration {
  #         show-icons:              true;
  #         display-drun:            " ";
  #         display-run:             " ";
  #         display-filebrowser:      " ";
  #         display-window:          " ";
  #         drun-display-format:     "{name}";
  #         window-format:           "{w}{c}";
  #     }

  #     /*****----- Global Properties -----*****/
  #     * {
  #         active-background:       #${colors.primary};
  #         active-foreground:       #${colors.text};
  #         normal-background:       #${colors.background};
  #         normal-foreground:       #${colors.text};
  #         urgent-background:       #${colors.error};
  #         urgent-foreground:       #${colors.text};

  #         alternate-active-background:    #${colors.background};
  #         alternate-active-foreground:    #${colors.text};
  #         alternate-normal-background:    #${colors.background};
  #         alternate-normal-foreground:    #${colors.text};
  #         alternate-urgent-background:    #${colors.background};
  #         alternate-urgent-foreground:    #${colors.text};

  #         selected-active-background:     #${colors.error};
  #         selected-active-foreground:     #${colors.text};
  #         selected-normal-background:     #${colors.primary};
  #         selected-normal-foreground:     #${colors.text};
  #         selected-urgent-background:     #${colors.yellow};
  #         selected-urgent-foreground:     #${colors.text};

  #         background-color:        #${colors.background};
  #         background:              #${colors.background};
  #         foreground:              #${colors.text};
  #         border-color:            #${colors.background};
  #         spacing:                 2;
  #     }

  #     /*****----- Main Window -----*****/
  #     window {
  #         transparency:            "real";
  #         enabled:                 true;
  #         location:                center;
  #         anchor:                  center;
  #         fullscreen:              true;
  #         cursor:                  "default";
  #     }

  #     /*****----- Main Box -----*****/
  #     mainbox {
  #         enabled:                 true;
  #         padding:                 10%;
  #         children:                [ "inputbar", "listview" ];
  #         spacing:                 8%;
  #     }

  #     /*****----- Inputbar -----*****/
  #     inputbar {
  #         enabled:                 true;
  #         spacing:                 10px;
  #         padding:                 15px;
  #         border:                  0.2% solid;
  #         border-radius:           12px;
  #         border-color:            @selected-normal-background;
  #         background-color:        transparent;
  #         text-color:              @foreground;
  #         children:                [ "prompt", "entry" ];
  #         margin:                  0% 30% 0% 30%;
  #     }

  #     prompt {
  #         enabled:                 true;
  #     }

  #     textbox-prompt-colon {
  #         enabled:                 true;
  #         expand:                  false;
  #         str:                     "::";
  #         background-color:        inherit;
  #         text-color:              inherit;
  #     }

  #     entry {
  #         enabled:                 true;
  #         background-color:        inherit;
  #         text-color:              inherit;
  #         cursor:                  text;
  #         placeholder:             "Search...";
  #         placeholder-color:       inherit;
  #     }

  #     /*****----- Listview -----*****/
  #     listview {
  #         padding:                 10px;
  #         columns:                 6;
  #         lines:                   4;
  #         cycle:                   false;
  #         dynamic:                 true;
  #         flow:                    horizontal;
  #         border:                  0;
  #         spacing:                 2%;
  #         background-color:        transparent;
  #         text-color:              @foreground;
  #         cursor:                  "default";
  #     }

  #     /*****----- Elements -----*****/
  #     element {
  #         enabled:                 true;
  #         orientation:             vertical;
  #         spacing:                 10px;
  #         padding:                 20px;
  #         border-radius:           10px;
  #         background-color:        transparent;
  #         text-color:              @foreground;
  #         cursor:                  pointer;
  #     }

  #     element normal.normal {
  #         background-color:        transparent;
  #         text-color:              @foreground;
  #     }

  #     element selected.normal {
  #         background-image:        @selected-normal-background;
  #         text-color:              @background;
  #         padding:                 2.5% 0% 2.5% 0%;
  #     }

  #     element-icon {
  #         size:                    7%;
  #     }

  #     scrollbar {
  #         handle-width:            5px;
  #         handle-color:            @selected;
  #         border-radius:           0px;
  #         background-color:        @background-alt;
  #     }

  #     element-text {
  #         expand:                  true;
  #         horizontal-align:        0.5;
  #         vertical-align:          0.5;
  #         margin:                  0.5% 0.5% -0.5% 0.5%;
  #     }
  #   '';

  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
  };

  home.packages = with pkgs; [
    rofi-power-menu
  ];
}
