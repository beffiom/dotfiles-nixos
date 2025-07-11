# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:


let
  username = "beffiom";
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

# Flakes
nix = {
  package = pkgs.nixVersions.stable;
  extraOptions = "experimental-features = nix-command flakes";
};

  powerManagement.enable = true;
  systemd = {
    sleep = {
      # Configures /etc/systemd/sleep.conf
      extraConfig = ''
        HandleLidSwitch=suspend
        HandleLidSwitchExternalPower=suspend
        HandleLidSwitchDocked=ignore
      '';
    };
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "hyprnix";
    networkmanager.enable = true;
  };

  security.polkit.enable = true;
  security.sudo.wheelNeedsPassword = false;

  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
  hardware.firmware = [ pkgs.linux-firmware ];
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

#services.pipewire.wireplumber.extraConfigs = {
#    enable = true;
#    "10-disable-camera" = {
#      "wireplumber.profiles" = {
#        main = {
#          "monitor.libcamera" = "disabled";
#        };
#      };
#    };
#  };

  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    };
  };

  # Set Time Zone
  time.timeZone = "America/New_York";
  services.chrony.enable = true;

  # Enable Virtualisation
  virtualisation.libvirtd.enable = true;
  #programs.virt-manager.enable = true;
  # services.qemuGuest.enable = true;

  # Set Compositor
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  security.pam.services.swaylock = {};
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = false; # Disables wlr portals when using Hyprland
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };

fonts.packages = with pkgs; [
  noto-fonts
  noto-fonts-cjk-sans
  noto-fonts-emoji
  liberation_ttf
  fira-code
  fira-code-symbols
  mplus-outline-fonts.githubRelease
  dina-font
  proggyfonts
  font-awesome
  nerd-fonts._3270
  nerd-fonts.agave
  nerd-fonts.anonymice
  nerd-fonts.arimo
  nerd-fonts.aurulent-sans-mono
  nerd-fonts.bigblue-terminal
  nerd-fonts.bitstream-vera-sans-mono
  nerd-fonts.blex-mono
  nerd-fonts.caskaydia-cove
  nerd-fonts.caskaydia-mono
  nerd-fonts.code-new-roman
  nerd-fonts.comic-shanns-mono
  nerd-fonts.commit-mono
  nerd-fonts.cousine
  nerd-fonts.d2coding
  nerd-fonts.daddy-time-mono
  nerd-fonts.departure-mono
  nerd-fonts.dejavu-sans-mono
  nerd-fonts.droid-sans-mono
  nerd-fonts.envy-code-r
  nerd-fonts.fantasque-sans-mono
  nerd-fonts.fira-code
  nerd-fonts.fira-mono
  nerd-fonts.geist-mono
  nerd-fonts.go-mono
  nerd-fonts.gohufont
  nerd-fonts.hack
  nerd-fonts.hasklug
  nerd-fonts.heavy-data
  nerd-fonts.hurmit
  nerd-fonts.im-writing
  nerd-fonts.inconsolata
  nerd-fonts.inconsolata-go
  nerd-fonts.inconsolata-lgc
  nerd-fonts.intone-mono
  nerd-fonts.iosevka
  nerd-fonts.iosevka-term
  nerd-fonts.iosevka-term-slab
  nerd-fonts.jetbrains-mono
  nerd-fonts.lekton
  nerd-fonts.liberation
  nerd-fonts.lilex
  nerd-fonts.martian-mono
  nerd-fonts.meslo-lg
  nerd-fonts.monaspace
  nerd-fonts.monofur
  nerd-fonts.monoid
  nerd-fonts.mononoki
  nerd-fonts.noto
  nerd-fonts.open-dyslexic
  nerd-fonts.overpass
  nerd-fonts.profont
  nerd-fonts.proggy-clean-tt
  nerd-fonts.recursive-mono
  nerd-fonts.roboto-mono
  nerd-fonts.shure-tech-mono
  nerd-fonts.sauce-code-pro
  nerd-fonts.space-mono
  nerd-fonts.symbols-only
  nerd-fonts.terminess-ttf
  nerd-fonts.tinos
  nerd-fonts.ubuntu
  nerd-fonts.ubuntu-mono
  nerd-fonts.ubuntu-sans
  nerd-fonts.victor-mono
  nerd-fonts.zed-mono
];

  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Enable btrfs auto scrubbing
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/" ];
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];

  # Set zsh as the Default Shell
  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    createHome = true;
    home = "/home/${username}";
    uid = 1000;
    group = "users";
    extraGroups = [ "wheel" "networkmanager" "libvirtd" "seat" "input" "audio" "video"];
    #shell = pkgs.dash;
  };

  system.activationScripts.setHomeOwnership = "chown -R ${config.users.users."${username}".name}:users /home/${config.users.users."${username}".name}";

  environment.sessionVariables = {
    GBM_BACKEND = "radeon";
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    home-manager
    hyprland
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    polkit
    dconf
    wayland
    vim
    neovim
    wget
    curl
    ntfs3g
    git
    dash
    htop
    amdvlk
    file
    fd
    fzf
    ripgrep
    networkmanager
    wpa_supplicant
    dnsmasq
    privoxy
    dnscrypt-proxy2
    gnumake
    gcc.cc.libgcc
    pkg-config
    chrony
    dhcpcd
    python3
    python311Packages.pip
    cliphist
    wl-clipboard
  ];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      mesa
      amdvlk
      rocmPackages.clr.icd
      vulkan-tools
    ];

    # Required for Framework AMD laptops
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?
}
