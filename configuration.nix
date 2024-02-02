{ config, pkgs, ... }: {

    environment.systemPackages = [
        pkgs.gnumake
        pkgs.libgcc
        pkgs.pkg-config

        pkgs.acpi
        pkgs.acpid

        pkgs.networkmanager
        pkgs.wpa_supplicant
        pkgs.nmcli
        pkgs.nmtui
        pkgs.chrony
        pkgs.protonvpn-cli
        pkgs.dnsmasq
        pkgs.privoxy
        pkgs.dnscrypt-proxy

        pkgs.alsa-utils
        pkgs.pipewire
        pkgs.wireplumber
        pkgs.pulsemixer
        pkgs.bluez
        pkgs.bluez-alsa
        pkgs.bluez-tools

        pkgs.wezterm
        pkgs.yazi
        pkgs.neovim
        pkgs.dash
        pkgs.htop
        pkgs.curl
        pkgs.git
        pkgs.wget
        pkgs.neofetch
        pkgs.cmatrix
        pkgs.unar
        pkgs.file
        pkgs.fd
        pkgs.rg
        pkgs.fzf
        pkgs.zoxide

        pkgs.mpv
        pkgs.imv
        pkgs.libva
        pkgs.ffmpeg
        pkgs.imagemagick
        pkgs.maim
        pkgs.ffmpegthumbnailer
        pkgs.jq
        pkgs.mpv-mpris
        pkgs.playerctl
        pkgs.yt-dlp

        pkgs.hyprland
        pkgs.xdgs-desktop-portal-hyprland
        pkgs.waybar
        pkgs.waybar-mpris
        pkgs.tofi
        pkgs.libsForQt5.polkit-kde-agent
        pkgs.swaybg
        pkgs.swaylock
        pkgs.hyprpicker
        pkgs.cliphist
        pkgs.dunst
        pkgs.inotify-tools

        pkgs.gtk3
        pkgs.lxappearance
        pkgs.adapta-gtk-theme

        pkgs.noto-fonts-cjk-sans
        pkgs.noto-fonts-cjk-serif
        pkgs.noto-fonts-color-emoji
        pkgs.hunspell
        pkgs.hunspellDicts.en_US
        pkgs.mythes
        pkgs.capitaine-cursors

        pkgs.brave
        pkgs.calibre
        pkgs.zathura
        pkgs.youtube-tui
        pkgs.newsboat
        pkgs.mpd
        pkgs.mpc
        pkgs.ncmpcpp
        pkgs.rtorrent

        pkgs.libvirt
        pkgs.qemu
        pkgs.virt-manager
    ];

    hardware.opengl.extraPackages = [
        rocmPackages.clr.icd
        pkgs.amdvlk
    ];

    programs.hyprland.enable = true;
    xdg.portal.wlr.enable = true;

    networking = {
        hostName = "nixos";
        networkmanager.enable = true;
        networkmanager.unmanaged = ["*" "except:type:wwan" "except:type:gsm"];
    };

    services = {
        chrony.enable = true;

        pipewire = {
            enable = true;
            wireplumber.enable = true;
            alsa.enable = true;
            pulse.enable = true;
            media-session.enable = true;
            media-session.config.bluez-monitor.rules = [
                {
                    # Matches all cards
                    matches = [ { "device.name" = "~bluez_card.*"; } ];
                    actions = {
                        "update-props" = {
                            "bluez5.reconnect-profiles" = [ "hfp_hf" "hsp_hs" "a2dp_sink" ];
                            "bluez5.msbc-support" = true;
                            "bluez5.sbc-xq-support" = true;
                        };
                    };
                }
                {
                    matches = [
                        { "node.name" = "~bluez_input.*"; }
                        { "node.name" = "~bluez_output.*"; }
                    ];
                }
            ];
        };
    };

    security = {
        rtkit.enable = true;
    }

    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
    # services.qemuGuest.enable = true;

    users.users.<myuser>.extraGroups = [ "networkmanager" ];
    users.users.<myuser>.extraGroups = [ "libvirtd" ];

    # Automatic Garbage Collection
    nix.gc = {
        automatic = true
        dates = "weekly"
        options = "--delete-older-than 7d"
    };
}
