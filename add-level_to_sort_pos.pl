#!/usr/bin/perl

$current_level = 0;
while(<>){
	chomp;
	if($_ =~ /:s:/){
		$current_level = $current_level + 1;
		print "$_\t$current_level\n";
	}elsif($_ =^ /:e:/){
		$current_level = $current_level - 1;
		print "$_\t$current_level\n";
	}else{
		print "$_\t$current_level\n";
	}
}
