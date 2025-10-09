{ pkgs, ... }:

{
	virtualisation.docker.rootless = {
		enable = true;
		setSocketVariable = true;
	};
	users.users.codybense.extraGroups = [ "docker" ];
}
