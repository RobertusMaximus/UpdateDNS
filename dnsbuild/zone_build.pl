#  Build zone files for each zone - FBB
#  Written by Robert Day CISSP 2/28/08
#
#   file : zone_build.pl
#
#   function : Build zone files for each zone 
#
#    use arguments zonename filename
#
#   part of : N/A
#
##############################################

#!/usr/bin/perl

# vars

@head = ( ";\n",
          ";  Database file\n",
          ";  Zone file built by Zone_build.pl Auth: Robert Day CISSP\n",
          ";\n",
          "\n",
          "\$TTL 3h\n",
          "\n",
          "@                       IN  SOA ns01.svccorp.com.  postmaster.svccorp.com (\n",
          "                        	100          ; serial number\n",
          "                        	900          ; refresh\n",
          "                        	600          ; retry\n",
          "                        	86400        ; expire\n",
          "                        	3600       ) ; default remote TTL\n",
          ";\n",
          ";  NS records\n",
          ";\n",
          "\n",
          "\n",
          "@                       NS	ns02.svccorp.com.\n",
          "@                       NS	ns01.svccorp.com.\n",
          "\n",
          "\n",
          ";\n",
          ";  MX records\n",
          ";\n",
          "\n",
          "@                       MX	10	mailbox1.sci-us.com.\n",
          "@                       MX	10	mailbox2.sci-us.com.\n",
          "@                       MX	10	mailbox3.sci-us.com.\n",
          "\n",
          "\n",
          "\n",
          ";\n",
          ";  A and CNAME records\n",
          ";\n",
          "\n",
          "\n",
        );
@srv_rec;
@srv_rec_split;
$stamp1;
$ctr1;



# Program

main();


sub main{

  $zonename = $ARGV[0];
  $filename = $ARGV[1];
  chomp $zonename;
  chomp $filename;

  
  #functions
  fileload();
  datetime();
  dataload();
  printzone();
  
};

sub fileload{
        open(DOMAINFILE, "< ./$filename") or die "$filename file is missing from the working directory!\n";    
        @srv_rec = <DOMAINFILE>;
        close(DOMAINFILE);
};

sub datetime{
        $stamp1=`date +%H.%m.%d.%y`;
        chomp $stamp1;
};

sub dataload{
        my $ctr1="0";
        while(@srv_rec){
            my $tmp1 = pop @srv_rec;
            chomp $tmp1;
            $_=$tmp1;
            my $svrname;
            my $svrrec;
            ($svrname, $svrrec) = split/,/, $_, 2;
            chomp $svrname;
            chomp $svrrec;
            $srv_rec_split[$ctr1][0] = $svrname;
            $srv_rec_split[$ctr1][1] = $svrrec;
            $ctr1++;
            };
};

sub printzone{
      open(FILE3, ">> ./$zonename");
      print FILE3 ";  Build date: $stamp1\n";
      close(FILE3);
      my $ctrhead=@head;
      chomp $ctrhead;
      my $ctr3;
      for($ctr3="0";$ctr3<=$ctrhead;$ctr3++){
          open(FILE2, ">> ./$zonename");
          print FILE2 "$head[$ctr3]";
          close(FILE2);
          };      
    
      my $linenume3=@srv_rec_split;
      chomp $linenume3;
      $linenume3--;
      my $ctr2;
      ###########################################################
      # ===== reverse the array order ===== TODO
      ###########################################################
      
      for($ctr2="0";$ctr2<=$linenume3;$ctr2++){
          open(FILE1, ">> ./$zonename");
          print FILE1 "$srv_rec_split[$ctr2][1]             CNAME   $srv_rec_split[$ctr2][0]\n";
          close(FILE1);
      };
};
        
        
        
        
        
        
        
        
        
        
        
