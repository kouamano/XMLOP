#!/usr/bin/perl

while(<>){
	$_ =~ /<\/RES>([^<>]+)<ORG>/g;
	print "$1\n";
}
