grep -E "rts panic! - stopping execution|rts internal error|rts: kernel terminated|Power deactivated:|Error: unable to mount filesystem|Lustre mount FAILED|Temperature Over Limit on link card|Link PGOOD error latched on link card|Power Good signal deactivated:|MONITOR FAILURE While reading FanModule .*: Broken pipe|MONITOR FAILURE While setting fan speed .*: Broken pipe|MONITOR FAILURE monitor caught .*: Broken pipe and is stopping|FATAL kernel panic|power module status fault detected on node card|Local PGOOD error latched on link card|no ethernet link|MidplaneSwitchController::.* pap failed:|mmcs_server exited abnormally due to signal: Aborted|monitor caught .*: power module .* not present and is stopping|MidplaneSwitchController::.* iap failed:|ciodb exited abnormally due to signal: Aborted|rts assertion failed:|L3 major internal error|No power module .* found found on link card" all.FF > fail.t
