{ lib, config, pkgs, ... }:
{
    options = {
        python_module.enable = lib.mkEnableOption "enables python_module";
    };

    config = lib.mkIf config.python_module.enable {
        environment.systemPackages = with pkgs; [
            python3
        ];
    };
}
