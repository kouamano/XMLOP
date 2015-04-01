#!/usr/bin/perl

$current_level = 0;
while(<>){
	chomp;
	if($_ =~ /:s:/){
		$current_level = $current_level + 1;
		print "$_\t$current_level\n";
	}elsif($_ =~ /:e:/){
		print "$_\t$current_level\n";
		$current_level = $current_level - 1;
	}else{
		print "$_\t$current_level\n";
	}
}
