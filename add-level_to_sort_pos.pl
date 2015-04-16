#!/usr/bin/perl

$current_level = 0;
while(<>){
	chomp;
	if($_ =~ /^\.\//){
		#print "COND:0\n";
		$current_level = 0;
		print "$_\t$current_level\n";
	}elsif($_ =~ /:s:/){
		#print "COND:1\n";
		$current_level = $current_level + 1;
		print "$_\t$current_level\n";
	}elsif($_ =~ /:e:/){
		#print "COND:2\n";
		print "$_\t$current_level\n";
		$current_level = $current_level - 1;
	}else{
		#print "COND:3\n";
		print "$_\t$current_level\n";
	}
}
