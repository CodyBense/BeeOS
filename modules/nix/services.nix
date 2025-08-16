{ ... }:

{
    services.flatpak = {
        enable = true;
        update.onActivation = true;
    };

    services.power-profiles-daemon.enable = true;

    services.openssh.enable = true;

    services.tailscale.enable = true;
}
