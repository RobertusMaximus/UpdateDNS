;
;  Database file jardinesyfunerariasdelangel.com for jardinesyfunerariasdelangel.com zone.
;      Zone version:  106
;

@                       IN  SOA ns01.svccorp.com.  hostmaster.svccorp.com. (
                        	106          ; serial number
                        	900          ; refresh
                        	600          ; retry
                        	86400        ; expire
                        	3600       ) ; default TTL

;
;  Zone NS records
;

@                       NS	scihoudns01.svccorp.com.
@                       NS	ns01.svccorp.com.
ns01.svccorp.com.       A	67.99.40.24
@                       NS	ns02.svccorp.com.
ns02.svccorp.com.       A	67.99.40.25

;
;  Zone records
;

@                       A	67.99.40.16
www                     A	67.99.40.16
