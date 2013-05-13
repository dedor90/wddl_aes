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
my @array;

sub main
{
    #varibles

    #open file for read
    my $fh = IO::File->new('list.txt', 'r') or
        error("cannot open file for read ($!)");
    
    #open file for write
    my $wfh = IO::File->new('outout.txt', 'w') or
        error("cannot open file for write ($!)");
    
    #reading and writing to file    
    while (my $line = $fh->getline) {

        my @split = split(/\s+/,$line);
        my $bool = 1;
        foreach(@split){
            if ($bool){
                push @array, $_;
                $bool = 0;
                print $wfh $_;
            }
            else {
                chop($_);
                my $var = " ".$_. "_n, ";
                push @array, $var;
                $bool = 1;
                print $wfh $var;
            }
        }
     
       print $wfh "\n";
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




