#!/usr/bin/perl

while(<>){
	chomp;
	$_ =~ s/[\s\.,;<>\(\)\[\]\"]+/ /g;	#/usr/local/var/perl_word_delimiter.patt.1
	$_ =~ s/^\s+//;
	$_ =~ s/\s+$//;
	print " $_";
}
print "\n";
