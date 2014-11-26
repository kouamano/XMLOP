#!/usr/bin/perl

while(<>){
	$_ =~ s/[\s\.,:;-_<>\(\)\{\}\[\]]+/ /ig;	#/usr/local/var/perl_word_delimiter.patt.2
	print $_;

}
