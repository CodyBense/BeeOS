{ pkgs, ... }:

{
    hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
    };

    hardware.enableAllFirmware = true;
    hardware.enableAllHardware = true;

    hardware.keyboard.qmk.enable = true;

    hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
            vpl-gpu-rt
        ];
    };
}
