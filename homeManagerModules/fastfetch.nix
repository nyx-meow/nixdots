{ ... }: {
  programs.fastfetch = {
    enable = true;


    settings = {
      logo = {
        source = "nixos_small";
        padding = {
          right = 1;
        };
      };

      display = {
        separator = "  ";
      };

      modules = [
        {
          type = "os";
          key = "os";
          keyColor = "blue";
        }
        {
          type = "kernel";
          key = "kn";
          keyColor = "blue";
        }
        {
          type = "packages";
          key = "pk";
          keyColor = "blue";
        }
        # {
        #   type = "display";
        #   key = "   ds";
        #   keyColor = "green";
        # }
        {
          type = "wm";
          key = "wm";
          keyColor = "blue";
        }
        {
          type = "terminal";
          key = "tm";
          keyColor = "blue";
        }
        {
          type = "shell";
          key = "sh";
          keyColor = "blue";
        }
        "break"
        {
          type = "cpu";
          format = "{1}";
          key = "cpu";
          keyColor = "magenta";
        }
        {
          type = "gpu";
          format = "{2}";
          key = "gpu";
          keyColor = "magenta";
        }
        {
          type = "gpu";
          format = "{1}";
          key = "drv";
          keyColor = "magenta";
        }
        {
          type = "memory";
          key = "mem";
          keyColor = "magenta";
        }
        {
          type = "command";
          key = "age";
          keyColor = "magenta";
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
        {
          type = "uptime";
          key = "utm";
          keyColor = "magenta";
        }
        {
          type = "command";
          key = "col";
          keyColor = "magenta";
          text = "echo Catppuccin Macchiato";
        }
        {
          type = "colors";
          paddingLeft = 0;
          symbol = "circle";
        }
        "break"
      ];
    };
  };
}
