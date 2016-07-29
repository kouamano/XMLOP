#!/usr/bin/perl

while(<>){
	@hit = $_ =~ /(<\/ORG>.+?<RES>)/g;
	foreach $j (@hit) {
		$j =~ s/^.*(<\/ORG>)/$1/;
		print "\t$j";
	}
	print "\n";
}
