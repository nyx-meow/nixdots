{ username, flake_dir, inputs, config, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    extraSpecialArgs = {
      inherit username flake_dir inputs;
      theme = config.theme;
      host = config.networking.hostName;
      zen-browser = inputs.zen-browser;
    };

    users.${username} = {
      imports = [
        ../../themes/black/home-manager/default.nix
        ../../themes/everforest/home-manager/default.nix
        ../../themes/lix/home-manager/default.nix
        ../../themes/macchiato/home-manager/default.nix
        ../../themes/kanso/home-manager/default.nix
        ../../modules/home-manager/desktop.nix
        ../../modules/home-manager/home.nix

        inputs.nixvim.homeModules.nixvim
        ../../modules/home-manager/tui/nixvim/default.nix

        ../../modules/home-manager/tui/nh.nix
        ../../modules/home-manager/tui/navi.nix
        ../../modules/home-manager/tui/btop.nix
        ../../modules/home-manager/gui/obs.nix
        ../../modules/home-manager/tui/clipse.nix
        ../../modules/home-manager/gui/dunst.nix
        ../../modules/home-manager/gui/emacs/emacs.nix
        ../../modules/home-manager/gui/foot.nix
        ../../modules/home-manager/tui/fzf.nix
        ../../modules/home-manager/tui/git.nix
        ../../modules/home-manager/gui/mpv.nix
        ../../modules/home-manager/tui/ncmpcpp.nix
        ../../modules/home-manager/gui/niri/niri.nix
        ./niri.nix
        ../../modules/home-manager/tui/nushell.nix
        ../../modules/home-manager/tui/starship.nix
        ../../modules/home-manager/gui/tofi.nix
        ../../modules/home-manager/gui/vesktop.nix
        ../../modules/home-manager/tui/yazi/yazi.nix
        ../../modules/home-manager/gui/zen/zen.nix
        ../../modules/home-manager/tui/zoxide.nix
        ../../modules/home-manager/tui/bash.nix
        # ../../modules/home-manager/gui/hyprland.nix
      ];
    };
  };
}
