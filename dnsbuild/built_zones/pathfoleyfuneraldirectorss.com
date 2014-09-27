;  Build date: 09.02.29.08
;
;  Database file
;  Zone file built by Zone_build.pl Auth: Robert Day CISSP
;


@                       IN  SOA ns01.svccorp.com.  postmaster.svccorp.com (
                        	100          ; serial number
                        	900          ; refresh
                        	600          ; retry
                        	86400        ; expire
                        	3600       ) ; default TTL
;
;  NS records
;


@                       NS	ns02.svccorp.com.
@                       NS	ns01.svccorp.com.


;
;  MX records
;

@                       MX	10	mailbox1.sci-us.com.
@                       MX	10	mailbox2.sci-us.com.
@                       MX	10	mailbox3.sci-us.com.



;
;  A and CNAME records
;


www             CNAME   scihoucws01
