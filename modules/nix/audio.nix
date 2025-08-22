{ pkgs, ... }:

{
    # hardware.alsa.enable = true;
    # boot.extraModprobeConfig = ''
    #     options snd-hda-intel model=dell-xps13
    # '';

    environment.systemPackages = with pkgs; [
        alsa-firmware
        alsa-utils
        inxi
        sof-firmware
    ];

    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
    };
    services.wireplumber.enable = true;
}
