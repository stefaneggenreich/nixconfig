# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };


  # TODO: Set your username
  home = {
    username = "plankton";
    homeDirectory = "/home/plankton";
  };

  services.xserver.xkb = {
    layout ="de";
    variant ="";
  };

  console.keyMap = "de";


  

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";


  # # Set your time zone.
  # time.timeZone = "Europe/Vienna";

  # # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";

  # i18n.extraLocaleSettings = {
  #   LC_ADDRESS = "de_AT.UTF-8";
  #   LC_IDENTIFICATION = "de_AT.UTF-8";
  #   LC_MEASUREMENT = "de_AT.UTF-8";
  #   LC_MONETARY = "de_AT.UTF-8";
  #   LC_NAME = "de_AT.UTF-8";
  #   LC_NUMERIC = "de_AT.UTF-8";
  #   LC_PAPER = "de_AT.UTF-8";
  #   LC_TELEPHONE = "de_AT.UTF-8";
  #   LC_TIME = "de_AT.UTF-8";
  # };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
