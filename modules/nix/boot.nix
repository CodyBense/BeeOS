{ pkgs, ... }: 

{
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    #boot.kernelPackages = pkgs.linuxPackages_latest;
    # boot.extraModprobeConfig = ''
    #     options snd-hda-intel dmic_detect=0
    # '';
    # boot.extraModprobeConfig = ''
    #     options snd-intel-dspcfg dsp_driver=1
    # '';
    # boot.extraModprobeConfig = ''
    #     options snd_hda_intel index=1,0
    # '';
}
