#!/usr/bin/perl

while(<>){
	if($_ =~ /^\[/){
		if($_ =~ /\[\[[0-9]+\]\]/){
			print "$_";
		}else{
			;
		}
	}else{
		print "$_";
	}
}
