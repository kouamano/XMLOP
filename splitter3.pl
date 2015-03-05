#!/usr/bin/perl

while(<>){
	chomp;
	$_ =~ s/[\s\.,:;\-_<>\(\)\{\}\[\]\'\"]+/ /ig;	#/usr/local/var/perl_word_delimiter.patt.3
	$_ =~ s/^\s*//;
	$_ =~ s/\s*$//;
	print " $_";
}
print "\n";
