;
;  Database file Ellisfunerals.com for Ellisfunerals.com zone.
;      Zone version:  106
;

@                       IN  SOA scihoudns01.svccorp.com.  hostmaster.svccorp.com. (
                        	106          ; serial number
                        	900          ; refresh
                        	600          ; retry
                        	86400        ; expire
                        	3600       ) ; default TTL

;
;  Zone NS records
;

@                       NS	scihoudns01.svccorp.com.
@                       NS	ns1.svccorp.com.
ns1.svccorp.com.        A	67.99.40.24
@                       NS	ns2.svccorp.com.
ns2.svccorp.com.        A	67.99.40.25
@                       NS	scihoudns02.svccorp.com.
scihoudns02.svccorp.com. A	192.168.250.25

;
;  Zone records
;

@                       A	67.99.40.55
www                     A	67.99.40.55
