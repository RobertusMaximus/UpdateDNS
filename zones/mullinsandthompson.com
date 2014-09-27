;
;  Database file mullinsandthompson.com for mullinsandthompson.com zone.
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

@                       NS	ns1.svccorp.com.
ns1.svccorp.com.        A	67.99.40.24
@                       NS	ns2.svccorp.com.
ns2.svccorp.com.        A	67.99.40.25

;
;  Zone records
;

@                       A	67.99.40.55
www                     A	67.99.40.55
