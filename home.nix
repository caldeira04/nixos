{ config, pkgs, inputs, ... }:

{

  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
    };
  };

  programs.git.enable = true;

  home.username = "caldeira";
  home.homeDirectory = "/home/caldeira";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    neovim
    fastfetch
    nerd-fonts.geist-mono
    btop
    bat
    yazi
    spotify-player
    vesktop
    eza
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    tmux
    fzf
    pavucontrol
    typescript
    gimp
    flameshot
    waybar
    p7zip
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".p10k.zsh".source = ./dotfiles/.p10k.zsh;
    ".config/hypr/hyprland.conf".source = ./dotfiles/.config/hypr/hyprland.conf;
    ".config/kitty/kitty.conf".source = ./dotfiles/.config/kitty/kitty.conf;
    ".config/nvim/".source = ./dotfiles/.config/nvim;
    ".config/spotify-player/".source = ./dotfiles/.config/spotify-player;
    ".config/waybar/".source = ./dotfiles/.config/waybar;
    ".local/scripts/".source = ./dotfiles/.local/scripts;
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/caldeira/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
