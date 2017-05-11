#!/usr/bin/perl

$tag = $ARGV[0];
$f = $ARGV[1];
$op1 = $ARGV[2];
if ($op1 eq "") {
	$op1 = "-E"; #Including other tags
}

open(IN,$f);
if($op1 eq "-e"){
	while(<IN>){
		@hit = $_ =~ /(<$tag>[^<>]*?<\/$tag>)/g;
		foreach $j (@hit) {
			print "$j\n";
		}
	}
}elsif($op1 eq "-E"){
	while(<IN>){
		@hit = $_ =~ /(<$tag>.*?<\/$tag>)/g;
		foreach $j (@hit) {
			print "$j\n";
		}
	}
}else{
	print "unknown option: $op1 \n";
}
close(IN);
