{ config, pkgs, ... }:

{
	programs.niri = {
	    settings = {
	        binds = with config.lib.niri.actions; {
	            # Your custom keybind
	            "Mod+T".action = spawn "ghostty";
	            
	            # Default niri keybinds using correct action names
	            "Mod+Shift+Slash".action = show-hotkey-overlay;
	            
	            # Quit niri
	            "Mod+Shift+E".action = quit;
	            
	            # Window management
	            "Mod+Q".action = close-window;
	            "Mod+F".action = fullscreen-window;
	            "Mod+Shift+F".action = toggle-windowed-fullscreen;
	            
	            # Focus windows - using correct actions
	            "Mod+H".action = focus-column-left;
	            "Mod+J".action = focus-window-down;
	            "Mod+K".action = focus-window-up;
	            "Mod+L".action = focus-column-right;
	            "Mod+Left".action = focus-column-left;
	            "Mod+Down".action = focus-window-down;
	            "Mod+Up".action = focus-window-up;
	            "Mod+Right".action = focus-column-right;
	            
	            # Alternative focus bindings
	            "Mod+Ctrl+H".action = focus-column-or-monitor-left;
	            "Mod+Ctrl+L".action = focus-column-or-monitor-right;
	            "Mod+Ctrl+J".action = focus-window-or-monitor-down;
	            "Mod+Ctrl+K".action = focus-window-or-monitor-up;
	            
	            # Move windows
	            "Mod+Shift+H".action = move-column-left;
	            "Mod+Shift+J".action = move-window-down;
	            "Mod+Shift+K".action = move-window-up;
	            "Mod+Shift+L".action = move-column-right;
	            "Mod+Shift+Left".action = move-column-left;
	            "Mod+Shift+Down".action = move-window-down;
	            "Mod+Shift+Up".action = move-window-up;
	            "Mod+Shift+Right".action = move-column-right;
	            
	            # Consume or expel windows from columns
	            "Mod+Comma".action = consume-window-into-column;
	            "Mod+Period".action = expel-window-from-column;
	            "Mod+Shift+Comma".action = consume-or-expel-window-left;
	            "Mod+Shift+Period".action = consume-or-expel-window-right;
	            
	            # Window and column sizing
	            "Mod+R".action = switch-preset-column-width;
	            "Mod+Shift+R".action = reset-window-height;
	            "Mod+Ctrl+F".action = maximize-column;
	            "Mod+C".action = center-column;
	            "Mod+Shift+C".action = center-window;
	            
	            # Finer width adjustments
	            "Mod+Minus".action = set-column-width "-10%";
	            "Mod+Equal".action = set-column-width "+10%";
	            "Mod+Shift+Minus".action = set-window-height "-10%";
	            "Mod+Shift+Equal".action = set-window-height "+10%";
	            
	            # Column focus
	            "Mod+WheelScrollDown".action = focus-column-right;
	            "Mod+WheelScrollUp".action = focus-column-left;
	            "Mod+Shift+WheelScrollDown".action = move-column-right;
	            "Mod+Shift+WheelScrollUp".action = move-column-left;
	            
	            "Mod+Home".action = focus-column-first;
	            "Mod+End".action = focus-column-last;
	            "Mod+Shift+Home".action = move-column-to-first;
	            "Mod+Shift+End".action = move-column-to-last;
	            
	            # Workspaces
	            "Mod+Tab".action = focus-workspace-down;
	            "Mod+Shift+Tab".action = focus-workspace-up;
	            "Mod+Page_Down".action = focus-workspace-down;
	            "Mod+Page_Up".action = focus-workspace-up;
	            "Mod+U".action = focus-workspace-down;
	            "Mod+I".action = focus-workspace-up;
	            "Mod+Shift+Page_Down".action = move-window-to-workspace-down;
	            "Mod+Shift+Page_Up".action = move-window-to-workspace-up;
	            "Mod+Shift+U".action = move-window-to-workspace-down;
	            "Mod+Shift+I".action = move-window-to-workspace-up;
	            
	            # Alternative workspace movement
	            "Mod+Ctrl+Page_Down".action = move-window-down-or-to-workspace-down;
	            "Mod+Ctrl+Page_Up".action = move-window-up-or-to-workspace-up;
	            
	            # Workspace numbers
	            "Mod+1".action = focus-workspace 1;
	            "Mod+2".action = focus-workspace 2;
	            "Mod+3".action = focus-workspace 3;
	            "Mod+4".action = focus-workspace 4;
	            "Mod+5".action = focus-workspace 5;
	            "Mod+6".action = focus-workspace 6;
	            "Mod+7".action = focus-workspace 7;
	            "Mod+8".action = focus-workspace 8;
	            "Mod+9".action = focus-workspace 9;
	            "Mod+0".action = focus-workspace 10;

	            # Monitors (if you have multiple)
	            "Mod+Shift+Ctrl+Left".action = move-window-to-monitor-left;
	            "Mod+Shift+Ctrl+Down".action = move-window-to-monitor-down;
	            "Mod+Shift+Ctrl+Up".action = move-window-to-monitor-up;
	            "Mod+Shift+Ctrl+Right".action = move-window-to-monitor-right;
	            
	            # Monitor focus
	            "Mod+Ctrl+Left".action = focus-monitor-left;
	            "Mod+Ctrl+Right".action = focus-monitor-right;
	            "Mod+Ctrl+Down".action = focus-monitor-down;
	            "Mod+Ctrl+Up".action = focus-monitor-up;
	            
	            # Screenshots - using correct actions with parameters
	            "Print".action = screenshot;
	            "Ctrl+Print".action = screenshot-window;
	            "Alt+Print".action = screenshot { show-pointer = true; };
	            "Shift+Print".action = screenshot-window { write-to-disk = true; };
	            
	            # Floating windows
	            "Mod+Space".action = toggle-window-floating;
	            "Mod+Shift+Space".action = switch-focus-between-floating-and-tiling;
	            
	            # Window swapping
	            "Mod+Ctrl+Shift+H".action = swap-window-left;
	            "Mod+Ctrl+Shift+L".action = swap-window-right;
	            
	            # System controls
	            "XF86AudioRaiseVolume".action = spawn ["pactl" "set-sink-volume" "@DEFAULT_SINK@" "+5%"];
	            "XF86AudioLowerVolume".action = spawn ["pactl" "set-sink-volume" "@DEFAULT_SINK@" "-5%"];
	            "XF86AudioMute".action = spawn ["pactl" "set-sink-mute" "@DEFAULT_SINK@" "toggle"];
	            "XF86AudioMicMute".action = spawn ["pactl" "set-source-mute" "@DEFAULT_SOURCE@" "toggle"];
	            "XF86MonBrightnessUp".action = spawn ["brightnessctl" "set" "10%+"];
	            "XF86MonBrightnessDown".action = spawn ["brightnessctl" "set" "10%-"];
	            
	            # Power management
	            "Mod+Shift+P".action = power-off-monitors;
	            "Mod+Shift+Ctrl+P".action = power-on-monitors;
	            
	            # System suspend
	            "Mod+Shift+S".action = suspend;
	            
	            # Debug toggles (useful for development)
	            "Mod+Shift+Ctrl+T".action = toggle-debug-tint;
	            "Mod+Shift+Ctrl+O".action = debug-toggle-opaque-regions;
	            "Mod+Shift+Ctrl+D".action = debug-toggle-damage;
	            
	            # Layout switching
	            "Mod+Backslash".action = switch-layout "next";
	            "Mod+Shift+Backslash".action = switch-layout "prev";
	            
	            # Column tabbed display
	            "Mod+Shift+T".action = toggle-column-tabbed-display;
	        };
	        
	        # Additional niri settings
	        prefer-no-csd = true;
	        hotkey-overlay.skip-at-startup = true;
	        
	        # Input settings
	        input = {
	            keyboard = {
	                xkb = {
	                    layout = "us";
	                };
	            };
	            
	            touchpad = {
	                tap = true;
	                natural-scroll = true;
	            };
	        };
	        
	        # Window rules (optional)
	        window-rules = [
	            {
	                matches = [{ app-id = "firefox"; }];
	                default-column-width = { proportion = 0.5; };
	            }
	        ];
	        
	        # Layout settings
	        layout = {
	            gaps = 16;
	            center-focused-column = "never";
	            preset-column-widths = [
	                { proportion = 1.0 / 3.0; }
	                { proportion = 1.0 / 2.0; }
	                { proportion = 2.0 / 3.0; }
	            ];
	            default-column-width = { proportion = 1.0 / 2.0; };
	        };
	    };
	};
}
