{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        alsa-firmware
        alsa-utils
        inxi
        sof-firmware
    ];

    services.pulseaudio.enable = false;
    security.rtkit.enable = true;

    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
    };
}
