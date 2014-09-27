#  Build zone files for each zone - FBB
#  Written by Robert Day CISSP 11/20/09
#
#   file : zone_bulk_build.pl
#
#   function : Build zone files in bulk (same type) 
#
#    use arguments zone_file_name
#
#   part of : N/A
#
##############################################

#!/usr/bin/perl

# vars


@srv_rec;

# Program

main();


sub main{
  $filename = $ARGV[0];
  chomp $filename;  
  #functions
  fileload();
  copyzone();
};

sub fileload{
        open(DOMAINFILE, "< ./$filename") or die "$filename file is missing from the working directory!\n";    
        @srv_rec = <DOMAINFILE>;
        close(DOMAINFILE);
};

sub copyzone{
  while(@srv_rec){
    my $tmp1 = pop @srv_rec;
    chomp $tmp1;
    system("cp ./example.com ./data/$tmp1");
  };
};

     
        
        
        
        
        
        
        
        
        
        
