{ cosmicLib, ... }:
let
  inherit (cosmicLib.cosmic) mkRON;
in
{
  xdg.configFile."cosmic/io.github.cosmic_utils.minimon-applet-dock" = {
    source = ./cosmic-minimon;
    recursive = true;
    force = true;
  };

  wayland.desktopManager.cosmic = {
    enable = true;

    panels = [
      {
        name = "Panel";
        anchor = mkRON "enum" "Top";
        anchor_gap = true;
        autohide = mkRON "optional" {
          wait_time = 1000;
          transition_time = 200;
          handle_size = 4;
          unhide_delay = 200;
        };
        autohover_delay_ms = mkRON "optional" 500;
        background = mkRON "enum" "Dark";
        border_radius = 8;
        exclusive_zone = false;
        expand_to_edges = false;
        keyboard_interactivity = mkRON "enum" "OnDemand";
        layer = mkRON "enum" "Top";
        margin = 4;
        opacity = 0.49;
        output = mkRON "enum" "All";
        padding = 0;
        padding_overlap = 0.5;
        size = mkRON "enum" "XS";
        spacing = 0;
        plugins_center = mkRON "optional" [
          "com.system76.CosmicAppletTime"
        ];
        plugins_wings = mkRON "optional" (
          mkRON "tuple" [
            [ ]
            [
              "com.system76.CosmicAppletInputSources"
              "com.system76.CosmicAppletStatusArea"
              "com.system76.CosmicAppletTiling"
              "com.system76.CosmicAppletAudio"
              "com.system76.CosmicAppletNetwork"
              "com.system76.CosmicAppletNotifications"
            ]
          ]
        );
      }
      {
        name = "Dock";
        anchor = mkRON "enum" "Bottom";
        anchor_gap = false;
        autohide = mkRON "optional" null;
        autohover_delay_ms = mkRON "optional" 500;
        background = mkRON "enum" "Dark";
        border_radius = 0;
        exclusive_zone = true;
        expand_to_edges = true;
        keyboard_interactivity = mkRON "enum" "OnDemand";
        layer = mkRON "enum" "Top";
        margin = 0;
        opacity = 1.0;
        output = mkRON "enum" "All";
        padding = 4;
        padding_overlap = 0.5;
        size = mkRON "enum" "S";
        spacing = 0;
        plugins_center = mkRON "optional" [
          "com.system76.CosmicAppList"
        ];
        plugins_wings = mkRON "optional" (
          mkRON "tuple" [
            [
              "com.system76.CosmicAppletPower"
              "com.system76.CosmicPanelWorkspacesButton"
              "com.system76.CosmicPanelAppButton"
            ]
            [
              "io.github.cosmic_utils.minimon-applet"
            ]
          ]
        );
      }
    ];
  };
}
