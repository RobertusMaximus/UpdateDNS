;
;  Database file dignityplanning.com for dignityplanning.com zone.
;      Zone version:  8
;

@                       IN  SOA scihoudns01.svccorp.com.  hostmaster.svccorp.com. (
                        	9            ; serial number
                        	900          ; refresh
                        	600          ; retry
                        	86400        ; expire
                        	3600       ) ; default TTL

;
;  Zone NS records
;

@                       NS	scihoudns01.svccorp.com.
@                       MX	10	mailbox2.sci-us.com.
@                       MX	10	mailbox3.sci-us.com.
@                       MX	10	mailbox1.sci-us.com.

;
;  Zone records
;

www                     CNAME	scihoucws01.sci-us.com.

