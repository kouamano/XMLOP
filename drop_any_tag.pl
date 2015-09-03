#!/usr/bin/perl

while(<>){
	chomp;
	$_ =~ s/<[^<>]*>/ /ig;
	$_ =~ s/^\s+//;
	$_ =~ s/\s+$//;
	$_ =~ s/\s+/ /g;
	print "$_\n";
}
