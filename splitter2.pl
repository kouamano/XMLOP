#!/usr/bin/perl

while(<>){
	$_ =~ s/[\s\.,:;\-_<>\(\)\{\}\[\]]+/ /ig;	#/usr/local/var/perl_word_delimiter.patt.2
	$_ =~s/^\s*//;
	$_ =~s/\s*$//;
	print " $_";
}
