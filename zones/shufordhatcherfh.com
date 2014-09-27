;
;  Database file shufordhatcherfh.com for shufordhatcherfh.com zone.
;      Zone version:  5
;

@                       IN  SOA scihoudns01.svccorp.com.  hostmaster.svccorp.com. (
                        	5            ; serial number
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
www                     A	67.99.40.55
