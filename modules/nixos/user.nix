{ pkgs, lib, config, spec, ... }:

{
  users.groups = {
    users = {};
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${spec.user}" = {
    isNormalUser = true;
    home = "/home/" + spec.user;
    initialPassword = "q";
    extraGroups = [ "wheel" "users" "input" "uinput" ]; # Enable ‘sudo’ for the user.
  };
}
