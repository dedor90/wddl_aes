#!/usr/bin/perl
#PERL SCRIPT 
#Extracting XOR
#
# Replacing '[' ':] and ']' to _  
#

use strict;
use warnings;
use IO::File;

main(@ARGV);

my $ind = 0;

sub main
{
    #varibles

    #open file for read
    my $fh = IO::File->new('input.v', 'r') or
        error("cannot open file for read ($!)");
    
    #open file for write
    my $wfh = IO::File->new('output.v', 'w') or
        error("cannot open file for write ($!)");
    
    #reading and writing to file    
    while (my $line = $fh->getline) {

        $line =~ s|,|_n,|g;
        $line =~ s|;|_n;|g;
        
        $wfh->print($line);
        
    }
    
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print(STDERR "$0: $e\n");
    exit 0;
}



