#!/usr/bin/perl
use List::Util qw/max min/;

while(<>){
	@hit = {};
	@hit = $_ =~ /<[^<>\/]+>([^<>]+?)<\/[^<>]+?>/g;
	$min = min(@hit);
	print "$min\n";
}
