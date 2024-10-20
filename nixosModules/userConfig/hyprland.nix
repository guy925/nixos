{ lib, config, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      exec-once = [
	"swww-daemon &"
	  "swww img .wall"
	  "systemctl --user start plasma-polkit-agent"
	  "ags &"
      ];
      general = {
	gaps_in = "20";
	gaps_out = "30";
	border_size = "4";

#	"col.active_border" = "0xff7aa2f7";
#	"col.inactive_border" = "0xff292e42";
      };
      decoration = {
	rounding = "15";
	active_opacity = "1.0";
	inactive_opacity = "0.8";
	drop_shadow = "true";
	shadow_range = "100";
	shadow_render_power = "3";
	blur = {
	  enabled = "true";
	  size = "10";
	  passes = "3";
	  ignore_opacity = true;
	};
      };
      input = {
	follow_mouse = 1;
	sensitivity = 0.25;
	touchpad = {
	  natural_scroll = true;
	};
      };
      animations = {
	enabled = true;

	bezier = "bezier, 0.25, 0.1, 0.25, 1.25";
	animation = [
	  "windows, 1, 3, bezier"
	    "windowsOut, 1, 3, bezier, popin 80%"
	    "border, 1, 10, bezier"
	    "borderangle, 1, 3, bezier"
	    "fade, 1, 3, bezier"
	    "workspaces, 1, 3, bezier"
	];
      };

      dwindle = {
	pseudotile = "true";
	preserve_split = "true";
      };
      misc = {
	animate_manual_resizes = true;
      };
      "$mod" = "SUPER";
      bind =
	[
	"$mod, D, exec, ags -t applauncher"
	  "$mod, Q, killactive"
	  "CONTROL ALT, DELETE, exec, kitty --hold --class=prompt whiptail --yesno \"Do you want to exit?\" 10 50 && hyprctl dispatch exit "
	  "$mod, RETURN, exec, kitty"
	  "$mod, S, togglefloating"
	  ",XF86AudioLowerVolume, exec, wpctl set-volume  @DEFAULT_AUDIO_SINK@ 5%-"
	  ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
	  ",XF86AudioMute, exec, pactl -- set-sink-mute @DEFAULT_AUDIO_SINK@ toggle"
	  ",XF86AudioMicMute, exec, pactl -- set-source-mute 0 toggle"
	  ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
	  ",XF86MonBrightnessUp, exec, brightnessctl s +10"
	  "$mod, H, movefocus, l"
	  "$mod, J, movefocus, d"
	  "$mod, K, movefocus, u"
	  "$mod, L, movefocus, r"
	  "$mod SHIFT, H, movewindow, l"
	  "$mod SHIFT, J, movewindow, d"
	  "$mod SHIFT, K, movewindow, u"
	  "$mod SHIFT, L, movewindow, r"
	  "$mod CONTROL, H, resizeactive, -70 0"
	  "$mod CONTROL, J, resizeactive, 0 70"
	  "$mod CONTROL, K, resizeactive, 0 -70"
	  "$mod CONTROL, L, resizeactive, 70 0"
	  ]
	  ++(
	      builtins.concatLists (builtins.genList (i:
		  let ws = i + 1;
		  in [
		  "$mod, code:1${toString i}, workspace, ${toString ws}"
		  "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
		  ]
		  )
		9)
	    );
      bindm = [
	"$mod, mouse:272, movewindow"
	  "ALT, mouse:272, resizewindow"
      ];
    };
  };
}
