{ config, pkgs, ... }:

{

  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "beffiom";
  home.homeDirectory = "/home/beffiom";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
      "emacs-pgtk"
  ];
  home.packages = with pkgs; [
      firefox
      chromium
      nix-search-cli
      foot
      calibre
      emacs-pgtk
      android-tools
      zeal
      shellcheck
      pandoc
      vifm
      sbcl
      racket
      nixfmt-rfc-style
      gcc
      zsh-powerlevel10k
      fishPlugins.tide
      syncthing
      unar
      neovim
      vim
      bemenu
      tofi
      podman
      lf
      atuin
      beets
      nicotine-plus
      tmux
      yazi
      git
      gnugrep
      bc
      ripgrep
      fd
      profont
      font-awesome
      cmatrix
      zoxide
      speedtest-cli
      alsa-utils
      pipewire
      pulseaudio
      pulsemixer
      bluez
      bluez-alsa
      bluez-tools
      bluetuith
      (mpv.override {scripts = [mpvScripts.mpris];})
      libva
      waybar-mpris
      ffmpeg
      ueberzugpp
      ffmpegthumbnailer
      imagemagick
      poppler_utils
      djvulibre
      epub-thumbnailer
      fontpreview
      exif
      exiftool
      jq
      playerctl
      yt-dlp
      hyprland
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
      xwayland
      waybar
      waybar-mpris
      libsForQt5.polkit-kde-agent
      swaybg
      swaylock
      swayidle
      hyprpicker
      cliphist
      wl-clipboard
      wl-clipboard-x11
      dunst
      libnotify
      light
      inotify-tools
      gtk3
      adapta-gtk-theme
      hunspell
      hunspellDicts.en_US
      mythes
      capitaine-cursors
      mupdf
      mpd
      mpc
      rmpc
      rocmPackages.clr.icd
      qbittorrent
      libvirt
      qemu
      virt-manager
      brightnessctl
      unzip
      udisks
      lua
      clojure
      clojure-lsp
      go
      mullvad
      neomutt
      isync
      python314full
      pipx
    # # Adds the "hello" command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don"t forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command "my-hello" to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ""
    #   echo "Hello, ${config.home.username}!"
    # "")
    # now nerdfonts are separated in individual packages :
    terminus_font_ttf
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
    nerd-fonts.mplus
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

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through "home.file".
  home.file = {
    # # Building this configuration will create a copy of "dotfiles/screenrc" in
    # # the Nix store. Activating the configuration will then make "~/.screenrc" a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ""
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # "";
  };

  # Home Manager can also manage your environment variables through
  # "home.sessionVariables". These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don"t want to manage your shell
  # through Home Manager then you have to manually source "hm-session-vars.sh"
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
  #  /etc/profiles/per-user/beffiom/etc/profile.d/hm-session-vars.sh
  #
  home.sessionPath = [
    "$HOME/.config/userscripts/dmenu"
    "$HOME/.config/userscripts/notify"
    "$HOME/.config/userscripts/programs"
    "$HOME/.config/emacs/bin"
  ];
  home.sessionVariables = {
    #PATH="$PATH:$(du '$HOME/.local/bin/' | cut -f2 | tr '\n' ':' | sed 's/:*$//')";
    EDITOR = "nvim";
    XDG_CONFIG_HOME = "$HOME/.config";
    NIXPKGS_ALLOW_UNFREE = 1;
    WLR_RENDERER_ALLOW_SOFTWARE = 1;
    BROWSER = "brave";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Configure shell
  programs.fish = {
    enable = true;
     interactiveShellInit = ''
        set -U fish_greeting ""
    '';
    shellAliases  =  {
      e                 = "nvim";
      edit              = "nvim";
      yazi              = "yazi --cwd-file $(pwd)";
      vifm              = "bash ~/.config/vifm/scripts/vifmrun";
      ls                = "ls -hN --color=auto --group-directories-first";
      la                = "ls -A";
      grep              = "grep --color=auto";
      diff              = "diff --color=auto";
      wifi              = "nmtui";
      bluetooth         = "bluetuith";
      audio             = "pulsemixer";
      ytd               = "yt-dlp --cookies-from-browser brave --progress --embed-subs --embed-metadata --embed-chapters --sponsorblock-remove Sponsor -o '[%(uploader)s] %(title)s'";
      ytd-date          = "yt-dlp --format bestvideo+bestaudio --progress --console-title --embed-subs --embed-thumbnail --embed-metadata --embed-chapters --sponsorblock-remove Sponsor -o '[%(upload_date)s %(uploader)s] %(title)s'";
      yta               = "yt-dlp -x --format m4a";
      bemenu            = "bemenu-run -c -l 10 down -M 650 --scrollbar none -f --single-instance --fn 'FontAwesome 22' --hf '#85678f' --tf '#707880' -B 10 --bdr '#85678f' -R 15 -p run:";
      rtorrent          = "rtorrent";
      update-nix        = "sudo nixos-rebuild switch --upgrade --flake ~/.config/home-manager --impure";
      update-home       = "home-manager switch --flake ~/.config/home-manager --impure";
      edit-nix          = "sudo -E nvim /etc/nixos/configuration.nix";
      edit-nix-hardware = "sudo -E nvim /etc/nixos/hardware-configuration.nix";
      edit-home         = "nvim ~/.config/home-manager/home.nix";
      edit-hypr         = "nvim ~/.config/hypr/hyprland.conf";
    };
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
      y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
            builtin cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }
    '';
    shellAliases  =  {
      e                 = "nvim";
      edit              = "nvim";
      yazi              = "yazi --cwd-file $(pwd)";
      vifm              = "bash ~/.config/vifm/scripts/vifmrun";
      ls                = "ls -hN --color=auto --group-directories-first";
      la                = "ls -A";
      grep              = "grep --color=auto";
      diff              = "diff --color=auto";
      wifi              = "nmtui";
      bluetooth         = "bluetuith";
      audio             = "pulsemixer";
      ytd               = "yt-dlp --progress --console-title --embed-subs --embed-thumbnail --embed-metadata --embed-chapters --sponsorblock-remove Sponsor -o '[%(uploader)s] %(title)s'";
      ytd-date          = "yt-dlp --format bestvideo+bestaudio --progress --console-title --embed-subs --embed-thumbnail --embed-metadata --embed-chapters --sponsorblock-remove Sponsor -o '[%(upload_date)s %(uploader)s] %(title)s'";
      yta               = "yt-dlp -x --format m4a";
      bemenu            = "bemenu-run -c -l 10 down -M 650 --scrollbar none -f --single-instance --fn 'FontAwesome 22' --hf '#85678f' --tf '#707880' -B 10 --bdr '#85678f' -R 15 -p run:";
      update-nix        = "sudo nixos-rebuild switch --upgrade --flake ~/.config/home-manager --impure";
      update-home       = "home-manager switch --flake ~/.config/home-manager --impure";
      edit-nix          = "sudo -E nvim /etc/nixos/configuration.nix";
      edit-nix-hardware = "sudo -E nvim /etc/nixos/hardware-configuration.nix";
      edit-home         = "nvim ~/.config/home-manager/home.nix";
      edit-hypr         = "nvim ~/.config/hypr/hyprland.conf";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    plugins = [
      #{
      #  # will source zsh-autosuggestions.plugin.zsh
      #  name = "zsh-autosuggestions";
      #  src = pkgs.fetchFromGitHub {
      #    owner = "zsh-users";
      #    repo = "zsh-autosuggestions";
      #    rev = "v0.4.0";
      #    sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
      #  };
      #}
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    {
      name = "powerlevel10k-config";
      src = /home/beffiom/.config/zsh;
      file = ".p10k.zsh";
    }
    ];
    dotDir = ".config/zsh";
  };
}
