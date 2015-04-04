#!/usr/bin/perl

while(<>){
	if($_ =~ /<xref/){
		if($_ =~ /ref-type="bibr"/){
			print $_;
		}
	}else{
		print $_;
	}
}
