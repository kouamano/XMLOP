#!/usr/bin/perl
while(<>){
	if($_ =~ /(:.:<[^<>]*?)[\s>]/){
		print "$1\n";
	}
}
