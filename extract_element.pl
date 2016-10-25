#!/usr/bin/perl

$tag = $ARGV[0];
$f = $ARGV[1];

open(IN,$f);
while(<IN>){
	@hit = $_ =~ /(<$tag>[^<>]*<\/$tag>)/g;
	foreach $j (@hit) {
		print "$j\n";
	}
}
close(IN);
