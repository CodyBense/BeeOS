{ pkgs, config, ... }:

{
    systemd.services.blue_light_filter = {
        description = "Run blue light filter";
        # serviceConfig.ExecStart = "/etc/profiles/per-user/codybense/bin/blue_light_filter";
        serviceConfig.ExecStart = "/home/codybense/BeeOS/modules/home/scripts/blue_light_filter.sh";
        wantedBy = [ "timers.target" ];
    };

    systemd.timers.blue_light_filter = {
        description = "Run blue light filter at 9pm";
        timerConfig.OnCalendar = "21:00";
        timerConfig.AccuracySec = "1h";
        # unit = "blue_light_filter.service";
    };

}
