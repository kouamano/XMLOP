#!/usr/bin/perl

while(<>){
	if($_ =~ /^\.\//){
		print $_;
	}elsif($_ =~ /^[0-9]+.*<sec/){
		print $_;
	}elsif($_ =~ /^[0-9]+.*<\/sec/){
		print $_;
	}elsif($_ =~ /;;;/){
		print $_;
	}
}
