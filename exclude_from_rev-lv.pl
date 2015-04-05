#!/usr/bin/perl

$pr = 0;
while(<>){
	if($_ =~ /^\.\//){
		print $_;
	}
	if($_ =~ /^ \[/){
		print $_;
	}
	if($_ =~ /^;;;/){
		print $_;
	}
}
