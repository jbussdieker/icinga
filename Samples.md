# Host Status Details For All Host Groups

http://host/icinga/cgi-bin/status.cgi?hostgroup=all&style=hostdetail&nostatusheader&jsonoutput

`````
{ "cgi_json_version": "1.6.0",
"status": {
 "host_status": [
{ "host": "example.com", "status": "UP", "last_check": "12-07-2012 13:43:42", "duration": "204d  1h 14m 18s", "attempts": "1/3", "is_flapping": false, "in_scheduled_downtime": false, "active_checks_enabled": true, "passive_checks_enabled": true, "notifications_enabled": true, "has_been_acknowledged": false, "status_information": "PING OK - Packet loss = 0%, RTA = 0.50 ms"},
...
]}}
`````

# Service Status Details For Host Group 'hostgroup_name'

http://service/icinga/cgi-bin/status.cgi?hostgroup=hostgroup_name&style=detail&nostatusheader&jsonoutput

`````
{ "cgi_json_version": "1.6.0",
"status": {
 "service_status": [
{ "host": "example.com", "service": "some_service", "status": "OK", "last_check": "12-07-2012 13:48:56", "duration": "53d  2h 17m 32s", "attempts": "1/4", "is_flapping": false, "in_scheduled_downtime": false, "active_checks_enabled": true, "passive_checks_enabled": true, "notifications_enabled": true, "has_been_acknowledged": false, "status_information": "OK: Good Job!"},
...
]}}
`````

# Service Status Details For All Hosts

http://service/icinga/cgi-bin/status.cgi?host=all&nostatusheader&jsonoutput

`````
{ "cgi_json_version": "1.6.0",
"status": {
 "service_status": [
{ "host": "example.com", "service": "some_service", "status": "OK", "last_check": "12-07-2012 13:40:40", "duration": "66d  1h 14m 53s", "attempts": "1/4", "is_flapping": false, "in_scheduled_downtime": false, "active_checks_enabled": true, "passive_checks_enabled": true, "notifications_enabled": true, "has_been_acknowledged": false, "status_information": "OK: Good Job!"},
...
]}}
`````