#  Build the named.conf file on the master or slave on a named bind server - FBB
#  Written by Robert Day CISSP 1/9/08
#
#   file : dns_build.pl
#
#   function : Build the named.conf filr on the master or slave on a named bind server 
#
#   part of : N/A
#
#
#
##############################################

#!/usr/bin/perl

# vars
my @zone_names;
my $master1;
my $masterorslave;
my $namedconf = "/etc/bind/named.conf";
my $namedpath = "/etc/bind/";
my $tmp1;

# tools

my $mv = "/bin/mv";
my $cat = "/bin/cat";

# Program

main();


sub main{

  $zonefile = $ARGV[0];
  $master1 = $ARGV[1];
  $master2 = $ARGV[2];
  $masterorslave = $ARGV[3];
  chomp $zonefile;
  chomp $master1;
  chomp $master2;
  chomp $masterorslave;
  
  #functions
  fileload();
  zoneload();
  
};

sub fileload{
  open(DOMAINFILE, "< ./$zonefile") or die "$filename file is missing from the working directory!\n";    
  @zone_names = <DOMAINFILE>;
  close(DOMAINFILE);
};

sub zoneload{
    if($masterorslave eq "slave"){
      datetime();
      $old1="$namedpath$tmp1";
      system("$mv $namedconf $old1.named.conf" );
      system("$cat head.txt >> $namedconf");
      while(@zone_names){
        my $zone1 = pop @zone_names;
        chomp $zone1;
        my $line1 = "zone \"$zone1\" IN {";
        my $line2 = "        type slave;";
        my $line3 = "        file \"\/etc\/bind\/$zone1\";";
        my $line4 = "        masters{";
        my $line5 = "        $master1;";
        my $line7 = "        };";
        my $line8 = "        allow-transfer { none; };";
        my $line9 = "};";
        open(FILE1, ">> $namedconf");
        print FILE1 "\n";
        print FILE1 "$line1\n";
        print FILE1 "$line2\n";  
        print FILE1 "$line3\n";
        print FILE1 "$line4\n";
        print FILE1 "$line5\n";
        print FILE1 "$line6\n";
        print FILE1 "$line7\n";
        print FILE1 "$line8\n";
        print FILE1 "$line9\n";
        print FILE1 "\n";  
        close(FILE1);
        };
      system("$cat tail.txt >> $namedconf");
      
    }elsif($masterorslave eq "master"){
      datetime();
      $old1="$namedpath$tmp1";
      system("$mv $namedconf $old1.named.conf" );
      system("$cat head.txt >> $namedconf");
      while(@zone_names){
        my $zone1 = pop @zone_names;
        chomp $zone1;      
        my $line1 = "zone \"$zone1\" IN {";
        my $line2 = "        type master;";
        my $line3 = "        file \"\/etc\/bind\/$zone1\";";
        my $line4 = "        allow-transfer { $master1; $master2; };";
        my $line5 = "};";
        open(FILE1, ">> $namedconf");
        print FILE1 "\n";
        print FILE1 "$line1\n";
        print FILE1 "$line2\n";  
        print FILE1 "$line3\n";
        print FILE1 "$line4\n";
        print FILE1 "$line5\n";
        print FILE1 "\n";
        close(FILE1); 
        };   
      system("$cat tail.txt >> $namedconf");    
    
    }else{
      print "\n";
      print "==================================================================\n";
      print "Wrong parameters Humaniod!!!\n";
      print "Enter the following:\n";
      print "perl dns_build.pl zonefilename masteripaddress masteripaddress slaveormaster\n";
      print "Thank you!\n";
      print "==================================================================\n";
      print "\n";
    
    };
};

sub datetime{
        $tmp1=`date +%H.%m.%d.%y`;
        chomp $tmp1;
        };


