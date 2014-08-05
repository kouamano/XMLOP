#!/usr/bin/perl

@arr = ();
while(<>){
	if($_ !~ /;+/){
		push(@arr,$_);
	}
}
@sarr = sort {$a <=> $b} @arr;
print @sarr;
