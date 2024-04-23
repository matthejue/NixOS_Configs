{ config, lib, pkgs, spec, ... }:

{
  # hardware.uinput.enable = true;
  # users.groups.uinput.members = [ "areo" ];
  # users.groups.input.members = [ "areo" ];

  services.xremap = {
    enable = true;
    withWlroots = true;
    userName = "areo";
    watch = true;
    serviceMode = "user";
    # withHypr = true;
    yamlConfig = ''
      virtual_modifiers:
        - CapsLock
      modmap:
        - remap:
            CapsLock:
              held: CapsLock
              alone: Esc
      keymap:
        - name: Global
          remap:
            CapsLock-k: Up
            CapsLock-h: Left
            CapsLock-j: Down
            CapsLock-l: Right
            CapsLock-0: Home
            CapsLock-4: End
            # Semicolon: Leftbrace
            # Shift-Semicolon: Rightbrace
            # Apostrophe: Leftparen
            # Shift-Apostrophe: Rightparen
            # Leftbrace: '<'
            # Shift-Leftbrace: '>'
    '';
    # config = {
    #   modmap = [
    #     {
    #       # Global remap CapsLock to Esc
    #       name = "Global";
    #       remap = { "CapsLock" = {
    #                 held = "CapsLock";
    #                 alone = "Esc";
    #               };
    #                 "o-diaeresis" = "bracketleft";
    #                 "Odiaeresis" = "bracketright";
    #                 "adiaeresis" = "braceleft";
    #                 "Adiaeresis" = "braceright";
    #                 "udiaeresis" = "less";
    #                 "Udiaeresis" = "greater";
    #       };
    #     }
    #   ];
    #   keymap = [
    #     {
    #       name = "Brackes Braces Less Greater";
    #       remap = { 
    #         "C-u" = "PAGEUP"; 
    #       };
    #     }
    #     {
    #       name = "Vim Keybindings";
    #       remap = {
    #         "CapsLock-k" = "Up";
    #         "CapsLock-h" = "Left";
    #         "CapsLock-j" = "Down";
    #         "CapsLock-l" = "Right";
    #       };
    #       # application = {
    #       #   only = ["Hyprland"];
    #       # };
    #     }
    #   ];
    # };
  };
}
