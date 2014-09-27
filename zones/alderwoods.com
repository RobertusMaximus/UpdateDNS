;
;  Database file alderwoods.com for alderwoods.com zone.
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

@                       NS	ns2.svccorp.com.
@                       NS	scihoudns01.svccorp.com.
@                       NS	ns1.svccorp.com.

;
;  Zone records
;

@                       A	67.99.40.56
@                       A	206.47.129.66
@                       MX	10	mailbox1.sci-us.com.
@                       MX	10	mailbox2.sci-us.com.
ats                     A	206.47.129.64
ats2                    A	206.47.129.65
ats3                    A	206.47.129.65
dns                     A	209.53.185.36
epayweb                 A	67.99.40.140
exitsurvey              CNAME	www.alderwoods.com.
fhvpn                   A	208.181.60.184
fhvpn1                  A	208.181.60.184
fhvpn2                  A	208.181.60.184
fhvpnrr                 A	208.181.60.184
gateway                 A	208.181.60.177
ho                      A	208.181.60.177
locator                 A	206.47.129.66
metcep                  A	67.99.40.141
metftp                  A	209.53.185.36
p3necangm               CNAME	www.alderwoods.com.
p3necanlm               CNAME	www.alderwoods.com.
p3necanmgm              CNAME	www.alderwoods.com.
p3southgm               CNAME	www.alderwoods.com.
p3southlm               CNAME	www.alderwoods.com.
p3westgm                CNAME	www.alderwoods.com.
p3westlm                CNAME	www.alderwoods.com.
p3westmgm               CNAME	www.alderwoods.com.
rep                     A	206.47.129.67
search                  A	206.47.129.66
vpn                     A	208.181.60.184
www                     A	67.99.40.56
