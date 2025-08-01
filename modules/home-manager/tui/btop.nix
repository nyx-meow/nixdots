{

  programs.btop = {
    enable = true;

    settings = {
      color_theme = "btop.theme";
      theme_background = false;
      truecolor = true;
      force_tty = false;
      vim_keys = false;
      rounded_corners = true;

# "default", "braille", "block", "tty"
      graph_symbol = "braille";
      graph_symbol_cpu = "default";
      graph_symbol_gpu = "default";
      graph_symbol_mem = "default";
      graph_symbol_net = "default";
      graph_symbol_proc = "default";

# Manually set which boxes to show. Available values are "cpu mem net proc" and "gpu0" through "gpu5", separate values with whitespace.
      shown_boxes = "cpu mem net proc";

# Update time in milliseconds, recommended 2000 ms or above for better sample times for graphs.
      update_ms = 500;

      proc_sorting = "cpu lazy";


#* Reverse sorting order, true or false.
      proc_reversed = false;

#* Show processes as a tree.
      proc_tree = false;

#* Use the cpu graph colors in the process list.
      proc_colors = true;

#* Use a darkening gradient in the process list.
      proc_gradient = true;

#* If process cpu usage should be of the core it's running on or usage of the total available cpu power.
      proc_per_core = false;

#* Show process memory as bytes instead of percent.
      proc_mem_bytes = true;

#* Show cpu graph for each process.
      proc_cpu_graphs = true;

#* Use /proc/[pid]/smaps for memory information in the process info box (very slow but more accurate)
      proc_info_smaps = false;

#* Show proc box on left side of screen instead of right.
      proc_left = false;

#* (Linux) Filter processes tied to the Linux kernel(similar behavior to htop).
      proc_filter_kernel = false;

#* In tree-view, always accumulate child process resources in the parent process.
      proc_aggregate = false;

#* Sets the CPU stat shown in upper half of the CPU graph, "total" is always available.
#* Select from a list of detected attributes from the options menu.
      cpu_graph_upper = "Auto";

#* Sets the CPU stat shown in lower half of the CPU graph, "total" is always available.
#* Select from a list of detected attributes from the options menu.
      cpu_graph_lower = "Auto";

#* If gpu info should be shown in the cpu box. Available values = "Auto", "On" and "Off".
      show_gpu_info = "Auto";

#* Toggles if the lower CPU graph should be inverted.
      cpu_invert_lower = true;

#* Set to true to completely disable the lower CPU graph.
      cpu_single_graph = false;

#* Show cpu box at bottom of screen instead of top.
      cpu_bottom = false;

#* Shows the system uptime in the CPU box.
      show_uptime = false;

#* Show cpu temperature.
      check_temp = true;

#* Which sensor to use for cpu temperature, use options menu to select from list of available sensors.
      cpu_sensor = "Auto";

#* Show temperatures for cpu cores also if check_temp is true and sensors has been found.
      show_coretemp = true;

#* Set a custom mapping between core and coretemp, can be needed on certain cpus to get correct temperature for correct core.
#* Use lm-sensors or similar to see which cores are reporting temperatures on your machine.
#* Format "x:y" x=core with wrong temp, y=core with correct temp, use space as separator between multiple entries.
#* Example: "4:0 5:1 6:3"
      cpu_core_map = "";

#* Which temperature scale to use, available values: "celsius", "fahrenheit", "kelvin" and "rankine".
      temp_scale = "celsius";

#* Use base 10 for bits/bytes sizes, KB = 1000 instead of KiB = 1024.
      base_10_sizes = false;

#* Show CPU frequency.
      show_cpu_freq = true;

#* Draw a clock at top of screen, formatting according to strftime, empty string to disable.
#* Special formatting: /host = hostname | /user = username | /uptime = system uptime
      clock_format = "";

#* Update main ui in background when menus are showing, set this to false if the menus is flickering too much for comfort.
      background_update = true;

#* Custom cpu model name, empty string to disable.
      custom_cpu_name = "";

#* Optional filter for shown disks, should be full path of a mountpoint, separate multiple values with whitespace " ".
#* Begin line with "exclude=" to change to exclude filter, otherwise defaults to "most include" filter. Example: disks_filter="exclude=/boot /home/user".
      disks_filter = "";

#* Show graphs instead of meters for memory values.
      mem_graphs = true;

#* Show mem box below net box instead of above.
      mem_below_net = false;

#* Count ZFS ARC in cached and available memory.
      zfs_arc_cached = true;

#* If swap memory should be shown in memory box.
      show_swap = true;

#* Show swap as a disk, ignores show_swap value above, inserts itself after first disk.
      swap_disk = true;

#* If mem box should be split to also show disks info.
      show_disks = true;

#* Filter out non physical disks. Set this to false to include network disks, RAM disks and similar.
      only_physical = true;

#* Read disks list from /etc/fstab. This also disables only_physical.
      use_fstab = true;

#* Setting this to true will hide all datasets, and only show ZFS pools. (IO stats will be calculated per-pool)
      zfs_hide_datasets = false;

#* Set to true to show available disk space for privileged users.
      disk_free_priv = false;

#* Toggles if io activity % (disk busy time) should be shown in regular disk usage view.
      show_io_stat = true;

#* Toggles io mode for disks, showing big graphs for disk read/write speeds.
      io_mode = false;

#* Set to true to show combined read/write io graphs in io mode.
      io_graph_combined = false;

#* Set the top speed for the io graphs in MiB/s (100 by default), use format "mountpoint:speed" separate disks with whitespace " ".
#* Example: "/mnt/media:100 /:20 /boot:1".
      io_graph_speeds = "";

#* Set fixed values for network graphs in Mebibits. Is only used if net_auto is also set to false.
      net_download = 100;

      net_upload = 100;

#* Use network graphs auto rescaling mode, ignores any values set above and rescales down to 10 Kibibytes at the lowest.
      net_auto = true;

#* Sync the auto scaling for download and upload to whichever currently has the highest scale.
      net_sync = true;

#* Starts with the Network Interface specified here.
      net_iface = "";

#* Show battery stats in top right if battery is present.
      show_battery = true;

#* Which battery to use if multiple are present. "Auto" for auto detection.
      selected_battery = "Auto";

#* Show power stats of battery next to charge indicator.
      show_battery_watts = true;

#* Set loglevel for "~/.config/btop/btop.log" levels are: "ERROR" "WARNING" "INFO" "DEBUG".
#* The level set includes all lower levels, i.e. "DEBUG" will show all logging info.
      log_level = "WARNING";

#* Measure PCIe throughput on NVIDIA cards, may impact performance on certain cards.
      nvml_measure_pcie_speeds = true;

# Horizontally mirror the GPU graph
      gpu_mirror_graph = true;

# Custom gpu model name, empty string to disable
      custom_gpu_name0 = "";
      custom_gpu_name1 = "";
      custom_gpu_name2 = "";
      custom_gpu_name3 = "";
      custom_gpu_name4 = "";
      custom_gpu_name5 = "";
    };
  };
         }
