#!/usr/bin/perl

while(<>){
	chomp;
	$_ =~ s/[^0-9a-zA-Z]+/ /ig;	#/usr/local/var/perl_word_delimiter.patt.5
	$_ =~ s/^\s*//;
	$_ =~ s/\s*$//;
	print " $_";
}
print "\n";
