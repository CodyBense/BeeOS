{ ... }:
{
    services.cron = {
        enable = true;
        systemCronJobs = [
            "* 21 * * * codybense blue_light_filter 3000"
        ];
    };
}
