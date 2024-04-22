{ config, lib, pkgs, spec, ... }:

{
  services.xremap = {
    serviceMode = "user";
    userName = "areo";
  };
}
