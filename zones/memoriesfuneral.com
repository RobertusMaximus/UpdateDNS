;
;  Database file memoriesfuneral.com for memoriesfuneral.com zone.
;      Zone version:  8
;

@                       IN  SOA scihoudns01.svccorp.com.  hostmaster.svccorp.com. (
                        	8            ; serial number
                        	900          ; refresh
                        	600          ; retry
                        	86400        ; expire
                        	3600       ) ; default TTL

;
;  Zone NS records
;

@                       NS	scihoudns01.svccorp.com.
@                       NS	ns1.svccorp.com.
@                       NS	ns2.svccorp.com.

;
;  Zone records
;

@                       A	67.99.40.55
@                       MX	10	mailbox1.sci-us.com.
@                       MX	9	mailbox2.sci-us.com.
www                     A	67.99.40.55
