{ ... }:

{
    systemd.timers."blue_light_filter" = {
        wantedBy = [ "timers.target" ];
        partOf = [ "blue_light_filter.service" ];
        timerConfig.onCalendar = [ "21:00:00" ];
    };

    systemd.services."blue_light_filter" = {
        script = ''
            blue_light_filter 3000
        '';
        serviceConfig = {
            Type = "oneshot";
            User = "codybense";
        };
    };
}
