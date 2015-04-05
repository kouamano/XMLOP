#!/usr/bin/perl

while(<>){
	if($_ =~ /<article[^<>]+(article-type="[^\"<>]+")/){
		print "$1\n";
	}
}
