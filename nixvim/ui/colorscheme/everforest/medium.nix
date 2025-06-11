{ lib, config, ... }: {
  config = lib.mkIf (config.theme == "everforest_medium") {

    programs.nixvim.colorschemes.everforest = {
      enable = true;
      settings = {
        background = "medium";
        disable_italic_comments = true;
        show_eob = 0; # ~ at end of buffer
      };
    };
  };
}
