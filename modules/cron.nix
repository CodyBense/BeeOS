{ ... }:
{
    services.cron = {
        enable = true;
        systemCronJobs = [
            "* 21 * * * blue_light_filter 3000"
        ];
    };
}
