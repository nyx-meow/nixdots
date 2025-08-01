{ flake_dir, host, ... }: {
  programs.nushell = {
    enable = true;


    configFile.text = /* nu */ ''

      def rerun-with [new_cmd: string] {
        let hist = history | get command | last
          let parsed = parse $hist

          let args = $parsed.pipeline.commands.0.parts | skip 1

          do {
            ^$new_cmd ...$args
          }
      }


      # cd && ls
      def cs [msg: string] {
        cd $msg
        ls
      }

      def gl [] {
        let selection = (git log --oneline | lines | fzf)
        let hash = ($selection | split row " " | get 0)
        $hash | wl-copy
      }

      def hist [] {
        let selected = (history | reverse | get command | uniq | fzf)
        if ($selected | is-empty) == false {
          do $selected
        }
      }

      def record [] {
        cd ~/Videos
        let date = date now | format date "%Y-%m-%d %H:%M:%S"
        wf-recorder -r 60 -o DP-1 -f $"(date now | format date '%Y-%m-%d %H:%M:%S').mkv"
      }

      # convert .mp4 file to .mov
      def movify [msg: string] {
          let input = $msg
          let base = (echo $msg | path parse | get stem)
          let output = ($base | str join "") + ".mov"
          ^ffmpeg -i $input -c:v dnxhd -profile:v dnxhr_hq -c:a pcm_s16le -pix_fmt yuv422p $output
      }

      def nrun [...msg: string] {
        nix run nixpkgs\#($msg)
      }



      def nr [...msg: string] {
        # sudo nixos-rebuild switch --flake ${flake_dir}#nixos
        nh os switch ~/nix -H ${host}
        cd ~/nix
        git add .
        let timestamp = (date now | format date '%d/%m %H:%M:%S')
        let full_msg = if ($msg | is-empty) {
          $timestamp
        } else {
          $"($timestamp) ($msg | str join ' ')"
        }
        git commit -m $full_msg
      }


      # nix flake git commit
      def ngc [...msg: string] {
        cd ~/nix
        git add .
        let timestamp = (date now | format date '%d/%m %H:%M:%S')
        let full_msg = if ($msg | is-empty) {
          $timestamp
        } else {
          $"($timestamp) ($msg | str join ' ')"
        }
        git commit -m $full_msg
      }

      # nix flake git commit amend
      def nga [...msg: string] {
        cd ~/nix
        git add .
        let timestamp = (date now | format date '%d/%m %H:%M:%S')
        let full_msg = if ($msg | is-empty) {
          $timestamp
        } else {
          $"($timestamp) ($msg | str join ' ')"
        }
        git commit --amend -m $full_msg
      }

      def gcm [...msg: string] {
        git commit -m $msg
      }

      def timer [...msg: string] {
        let full_msg = ($msg | str join " ") + "m"
        termdown -s $full_msg
      }

      # search for process
      def lsproc [msg: string] {
      ps | where name =~ $"($msg)"
      }

      # copy path
      def jj [] {
        let path = pwd | str trim | wl-copy
        echo $"copied ($path)"
      }

      # copy file path
      def jf [...msg: string] {
        realpath ...$msg | str trim | wl-copy
        let path = realpath ...$msg
        echo $"copied ($path)"
      }

      # copy pwd relative to git root
      def jg [] {
        let root = (git rev-parse --show-toplevel | str trim)
        let rel = (realpath . | path relative-to $root)
        $rel | wl-copy
        echo $"copied ($rel)"
      }

      $env.path ++= ["~/go/bin"]

      $env.config = {
          cursor_shape: {
              emacs: line
              vi_insert: line
              vi_normal: block
          }

          show_banner: false
          table: {
              mode: none
              index_mode: never
          }

          keybindings: [
              # {
              #     name: "fzf_history"
              #     modifier: control
              #     keycode: char_s
              #     mode: emacs
              #     event: Send(EditCommand (ExternalCommand "bash" ["-c" "commandline edit (history | to text | lines | reverse | uniq | fzf)"]))
              # }
          ]
      }
    '';

   #  envFile.text = /* nu */ ''
   #  '';

    # loginFile.text = /* nu */ ''
    #   if (tty) == "/dev/tty1" {
    #     Hyprland
    #   }
    # '';


    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
      "......" = "cd ../../../../..";
      "......." = "cd ../../../../../..";

      back = "cd -";

      # hist="history | lines | fzf | read -l command; eval $command";
      fg = "job unfreeze";

      sudo = "sudo -k"; # prompt every time
      rm = "rm -i"; # prompt every time
      mv = "mv -i"; # prompt every time
      ln = "ln -i"; # prompt every time

      logout = "hyprctl dispatch exit 0";
      # l = "eza -lh  --icons=auto"; # long list
      ls = "eza -a1   --icons=auto"; # short list
      # ll = "eza -lha --icons=auto --sort=name --group-directories-first"; # long list all
      # ld = "eza -lhD --icons=auto"; # long list dirs
      # lt = "eza --icons=auto --tree"; # list folder as tree
      ff = "fastfetch --logo nixos_small --logo-color-2 magenta";



      ga = "git add .";
      # gl = "git log --oneline | lines | fzf";
      gcl = "git clone";
      gd = "git diff HEAD^";
      gs = "git status";
      gsw = "git switch";
      gps = "git push";
      gpl = "git pull";
      gb = "git branch";

      cr = "cargo run";

      meow = "echo :3"; # so silly

      na = "nvim ~/nix/packages.nix -c '/systemPackages'";
      ns = "nix-shell -p";

      n = "nvim";
    };


    environmentVariables = {
      MANPAGER = "nvim +Man!"; # use nvim for man
      SUDO_TIMESTAMP_TIMEOUT = 0;
      EDITOR = "nvim";
      VISUAL = "nvim";
      BROWSER = "zen";
      NIXOS_OZONE_WL = "1"; # tell things to use wayland
      NIXPKGS_ALLOW_UNFREE = "1";
      FZF_DEFAULT_OPTS = "--color=fg:#cad3f5,hl:#8bd5ca,fg+:#000000,bg+:#b7bdf8,hl+:#8bd5ca,info:#7f8c8d,prompt:#b7bdf8,spinner:-1,pointer:#b7bdf8,gutter:-1,info:#939ab7,border:-1 --border=none --info=hidden --header='' --prompt='󰘧 ' --no-bold -i --pointer=''";
    };


  };


}
