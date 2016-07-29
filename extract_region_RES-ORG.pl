#!/usr/bin/perl

while(<>){
	@hit = $_ =~ /(<\/RES>.+?<ORG>)/g;
	foreach $j (@hit) {
		$j =~ s/^.*(<\/RES>)/$1/;
		print "\t$j";
	}
	print "\n";
}
