#!/usr/bin/perl

while(<>){
	#$_ =~ s/[\s\.,;<>\(\)\[\]\"]+/ /g;	#/usr/local/var/perl_word_delimiter.patt.1
	$_ =~ s/[<>\(\)\[\]]/\n/g;
	$_ =~ s/. /\n/g;
	$_ =~ s/[\s\.,;]+/ /g;
	$_ =~ s/^\s+//;
	$_ =~ s/\s+$//;
	print "$_\n";
}
