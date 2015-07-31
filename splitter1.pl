#!/usr/bin/perl

while(<>){
	chomp;
	$_ =~ s/[\s\.,;<>\(\)\[\]"]+/ /ig;	#/usr/local/var/perl_word_delimiter.patt.1
	$_ =~ s/^\s+//;
	$_ =~ s/\s+$//;
	print " $_";
}
print "\n";
