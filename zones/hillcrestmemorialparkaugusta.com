;
;  Database file hillcrestmemorialparkaugusta.com for hillcrestmemorialparkaugusta.com zone.
;      Zone version:  119
;

@                       IN  SOA scihoudns01.svccorp.com.  hostmaster.svccorp.com. (
                        	119          ; serial number
                        	900          ; refresh
                        	600          ; retry
                        	86400        ; expire
                        	3600       ) ; default TTL

;
;  Zone NS records
;

@                       NS	scihoudns01.svccorp.com.

;
;  Zone records
;

@                       A	67.99.40.55
www                     A	67.99.40.55
