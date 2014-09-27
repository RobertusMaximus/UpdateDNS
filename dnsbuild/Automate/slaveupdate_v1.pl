#  Checks for a new named.conf file if it exists, it installs and restarts it - FBB
#  Written by Robert Day CISSP 8/11/08
#
#   file : slaveupdate_v1.pl
#
#   function : Checks for a new named.conf file if it exists, it installs and restarts it 
#
#   part of : N/A
#
#
#
##############################################
#!/usr/bin/perl

#shell tools
$cat="/bin/cat";
$ls="/bin/ls";
$grep="/bin/grep -i";
$kill9="/bin/kill -s 15";
$cp="/bin/cp -f";
$date="/bin/date";
$rm="/bin/rm -f";
$ps="/bin/ps x";
$df="/bin/df -h";
$wc="/usr/bin/wc -l";
$tmpfile1="/etc/load/named.conf";
#vars for program
$datenow;

main();

sub main{
  master();
  slave();
  
  
};

sub master{
  if(-e $tmpfile1){
    datetime();
    datetime2();
    $result1 = `mv /etc/bind/named.conf /root/OLD1/named.conf_$datenow`;
    chomp $results1;
    $result2 = `mv /etc/load/named.conf /etc/bind/named.conf`;
    chomp $results2;
    $result3 = `/etc/init.d/bind9 stop`;
    chomp $results3;
    $result4 = `/etc/init.d/bind9 start`;
    chomp $results4;
    $loadlines = `$grep -i "$datenow2" /var/log/daemon.log | $grep -i load | $wc`;
    chomp $loadlines;
    
    open(FILE,"> /var/log/dnsupdate.log");
	  print FILE "===========================================\n";
    print FILE "Zones that been loaded: $loadlines\n"; 
    print FILE "===========================================\n";
    print FILE "$results1\n";
	  print FILE "$results2\n";
    print FILE "$results3\n";
    print FILE "$results4\n";	
	  print FILE "\n";
    print FILE "===========================================\n";
	  close(FILE);
  }else{
    exit;
  };
};
# date sub
sub datetime{
    $datenow=`$date +%d.%m.%y.%T.`;
    chomp $datenow;
    };
    
sub datetime2{
    my $tempdate2 = `$date +%bX%d`;
    chomp $tempdate2;
    my $temptime2 = `$date +%H:%M`;
    chomp $temptime2;
    $_=$tempdate2;
    s/X/ /g;
    $tempdate22=$_;
    $datenow2="$tempdate22 $temptime2";
    print "$datenow2\n";
#    $datenow=`$date +%d.%m.%y.%T.`;
    chomp $datenow2;
    };
    
