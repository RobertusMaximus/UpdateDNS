;
;  Database file thisisdignity.com for thisisdignity.com zone.
;      Zone version:  10
;

@                       IN  SOA scihoudns01.svccorp.com.  hostmaster.svccorp.com. (
                        	10           ; serial number
                        	900          ; refresh
                        	600          ; retry
                        	86400        ; expire
                        	3600       ) ; default TTL

;
;  Zone NS records
;

@                       NS	scihoudns01.svccorp.com.
@                       NS	scihoudns02.svccorp.com.

;
;  Zone records
;

@                       CNAME	www.svccorp.com.
www                     CNAME	www.svccorp.com.
