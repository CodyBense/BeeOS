{ ... }:

{
    systemd.timers."blue_light_filter" = {
        wantedBy = [ "timers.target" ];
        timerConfig = {
            onCalendar = "21:00";
            Unit = "blue_light_filter.servcie";
        };
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
