{ flake_dir, username, ... }: {
  xdg.desktopEntries = {
    melee = {
      name = "melee";
      comment = "melee bash script";
      exec = "${flake_dir}/stuff/scripts/melee.sh";
      icon = "slippi-launcher";
      terminal = true;
    };
  };
}
