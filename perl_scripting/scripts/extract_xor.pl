#!/usr/bin/perl
#PERL SCRIPT 
#Extracting XOR
#
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
    my $wfh = IO::File->new('aes_cipher_top_wddl.sv', 'w') or
        error("cannot open file for write ($!)");

    my $pfh = IO::File->new('port_mapping.sv', 'w') or
        error("cannot open file for write($!)");


    #reading and writing to file    
    while (my $line = $fh->getline) {

        #if no '^' in line, then copy line to file
        if ($line !~ /\^/){
            $wfh->print($line);
        }

        else {
            #count number of carrots in line
            my $carrot_count  = count_carrots($line);
            
            #replace ^ with XOR

            my ($new_line, $A, $B) = replace_xor($line);
            my $x = $new_line;
                
            #add index number for numbering
            $line = add_index($new_line);
            $wfh->print($line);  
        
            #add complemtary line
            my $comp_line = add_comp_line($x);
            $wfh->print($comp_line);

            #write in port mapping file
            #portmap($inputA, $inputB);
            $B =~ s/\s+$//;
            $B =~ s|;||g;
            $pfh->print("//***** " . $ind . " ******* \n\n");
            $pfh->print("wddl_xor2 #(8)    XOR_ " . $ind . "\n");
            $pfh->print("{\n");
            $pfh->print(" .d0_p_in ( " . $A . " )\n");
            $pfh->print(",.d0_n_in ( " . $A . "_n  )\n");
            $pfh->print(",.d1_p_in ( " . $B  . " )\n");
            my $B_n = $B;
            $B_n =~ s|\[|_n\[|;
            $pfh->print(",.d1_n_in ( " . $B_n . " )\n");
            

            $B =~ s|\[|_|;
            $B =~ s|]||;
            $B =~ s|:|_|;
            
            
            $pfh->print(",.d_p_out ( " . $A . "_XOR_" . $B . ")\n");
            $pfh->print(",.d_n_out ( NOT_" . $A . "_XOR_" . $B . ")\n");
            $pfh->print("};\n\n");



        }
            
    }
    
}


sub add_comp_line
{
    my $line = shift or return;
    my @terms = split(/ /, $line);
    my $new_line = '';

    #write new line replacing ^ with XOR
    for (my $i = 0; $i < scalar @terms; $i++){
        if ($terms[$i] ne "="){
            $new_line = $new_line . $terms[$i] . " ";       
        }
        else {
            $new_line =~ s/\s+$//;
            $new_line = $new_line . "_n = NOT_";
        }
    }
    return $new_line;

}


sub replace_xor
{
    my $line  = shift or return;
    #split line by ' ' and put in array

    my @terms = split(/ /, $line);
    my $new_line = '';
    my $A; 
    my $B;


    #write new line replacing ^ with XOR
    for (my $i = 0; $i < scalar @terms; $i++){
        if ($terms[$i] ne "^"){
            $terms[$i] =~ s|\[|_|;
            $terms[$i] =~ s|]||;
            $terms[$i] =~ s|:|_|;
 
            $new_line = $new_line . $terms[$i] . " ";       
        }
        else {
            $new_line =~ s/\s+$//;
            $new_line = $new_line . "_XOR_";
            $A = $terms[$i-1];
            $B = $terms[$i+1];
            message($A);
            message($B);

        }
    }
    return ($new_line, $A, $B);
}

sub add_index
{
    $ind++;
    #add index comment in line
    my $new_line = shift or return; 
    $new_line =~ s/\s+$//;
    chomp($new_line);
    return $new_line . "   //****** " . $ind . " ***** \n";
}


sub count_carrots 
{
    my $line = shift or return;
    my $num = 0;
    $num++ while ($line =~ /\^/g);
    return $num;
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


