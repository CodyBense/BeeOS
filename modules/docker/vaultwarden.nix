{ config, pkgs, lib, ... }:
{
  virtualisation.oci-containers.container.vault = {
    image = "vaultwardern/server:latest";
    hostname = "vaultwardern";
    ports = [
      "3001:3001"
    ];
    volumes = [
    "/var/run/docker.sock:/var/run/docker.sock"
    ];
  };
}
