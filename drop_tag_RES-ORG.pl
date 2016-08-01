#!/usr/bin/perl

while(<>){
	$_ =~ s/<org[^<>]*?>//ig;
	$_ =~ s/<\/org[^<>]*?>//ig;
	$_ =~ s/<res[^<>]*?>//ig;
	$_ =~ s/<\/res[^<>]*?>//ig;
	print $_;
}
