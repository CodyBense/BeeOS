{ ... }:

{

	virtualization.docker.enable = true;
	users.users.codybense.extraGroups = [ "docker" ];
}
