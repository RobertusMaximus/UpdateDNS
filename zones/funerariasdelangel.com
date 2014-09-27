;
;  Database file funerariasdelangel.com for funerariasdelangel.com zone.
;      Zone version:  112
;

@                       IN  SOA ns01.svccorp.com.  hostmaster.svccorp.com. (
                        	112          ; serial number
                        	900          ; refresh
                        	600          ; retry
                        	86400        ; expire
                        	3600       ) ; default TTL

;
;  Zone NS records
;

@                       NS	scihoudns01.svccorp.com.
@                       NS	ns02.svccorp.com.
ns02.svccorp.com.       A	67.99.40.25
@                       NS	ns01.svccorp.com.
ns01.svccorp.com.       A	67.99.40.24

;
;  Zone records
;

@                       A	67.99.40.16
@                       MX	10	mailbox2.sci-us.com.
@                       MX	10	mailbox1.sci-us.com.
www                     A	67.99.40.16
