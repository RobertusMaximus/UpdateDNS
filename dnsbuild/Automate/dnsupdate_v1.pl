#  Runs the build dnsbuild program and automates everything - FBB
#  Written by Robert Day CISSP 8/11/08
#
#   file : dnsupdate_v1.pl
#
#   function : Run the build process for external dns 
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

#vars for program
$datenow;

main();

sub main{
  master();
  slave();
  
  
};

sub master{
  # Move old slave files to the ./OLD1 directory
  chomp $results1;
  $results2 = `perl ./bin/dns_build_master_v3.pl MASTERLIST*.txt 67.99.40.91 67.99.40.92 10.29.3.25 master`;
  chomp $results2;
  $results3 = `/etc/init.d/bind9 stop`;
  chomp $results3;
  print "$results3\n"; 
  print "=====================================================================\n";
  $results4 = `/etc/init.d/bind9 start`;
  chomp $results4;
  print "$results4\n"; 
  print "=====================================================================\n";
  
  sleep 2;
  datetime();
  
  $loadlines = `$grep -i "$datenow" /var/log/daemon.log | $grep -i load | $wc`;
  chomp $loadlines;
  print "Zones that been loaded: $loadlines\n"; 
  print "=====================================================================\n";
};

sub slave{
  #perl ./bin/dns_build_slave_v2.pl DNS_MASTER_ZONE_FILE.txt 192.168.240.90 slave
  $results5 =  `mv named.conf* ./OLD1`;
  chomp $results5;
  $results6 = `perl ./bin/dns_build_slave_v2.pl MASTERLIST*.txt 192.168.240.90 slave`;
  chomp $results6;
  $filename = `ls named.conf*`;
  chomp $filename;
  $results7 = `cp /root/dnsbuild/$filename /root/dnsbuild/OLD1/`;
  #print "$result7\n";
  #print "=====================================================================\n";
  $results8 = `mv /root/dnsbuild/$filename /root/dnsbuild/named.conf`;
  #print "$result8\n";
  #print "=====================================================================\n";
  print "Slave file created: $filename\n";
  print "=====================================================================\n";
  $result9 = `/usr/bin/expect -f /root/dnsbuild/bin/putnamed.exp`;
  print "$result9\n";
  print "=====================================================================\n";
  $result10 = `rm -f /root/dnsbuild/named.conf`;
  #print "$result9\n";
  #print "=====================================================================\n";
};

# date sub
sub datetime{
    my $tempdate = `$date +%bX%d`;
    chomp $tempdate;
    my $temptime = `$date +%H:%M`;
    chomp $temptime;
    $_=$tempdate;
    s/X/ /g;
    $tempdate2=$_;
    $datenow="$tempdate2 $temptime";
    print "$datenow\n";
#    $datenow=`$date +%d.%m.%y.%T.`;
    chomp $datenow;
    };
    
    
