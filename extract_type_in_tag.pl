#!/usr/bin/perl

while(<>){
	$_ =~ /(type=\"[^\"]+\")/;
	print "$1\n";
}
