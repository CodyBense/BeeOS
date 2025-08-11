{ pkgs, ... }:

{
    # hardware.alsa.enable = true;
    boot.extraModprobeConfig = ''
        options snd slots=snd-sof-soundwire
        options snd-hda-intel model=dell-xps13
    '';

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
