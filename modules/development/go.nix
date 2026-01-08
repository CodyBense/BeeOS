{ config, lib, pkgs, ... }:

{
 environment.systemPackages = with pkgs; [
   godef
   go
   gopls
   gotools
   gomodifytags
   gotests
   gore
   golangci-init
   delve
  ];
}
