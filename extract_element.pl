#!/usr/bin/perl

$tag = $ARGV[0];
$f = $ARGV[1];
$op1 = $ARGV[2];
if ($op1 eq "") {
	$op1 = "-E"; #Including other tags
}
$op2 = $ARGV[3];
if ($op2 eq "\\n") {
	$op2 = "\n";
}
$op3 = $ARGV[4];
if ($op3 eq "\\n") {
	$op3 = "\n";
}


open(IN,$f);
if($op1 eq "-e"){
	while(<IN>){
		@hit = $_ =~ /(<${tag}[^<>]*>[^<>]*?<\/$tag>)/g;
		foreach $j (@hit) {
			print "$j$op2";
		}
		print "$op3\n"
	}
}elsif($op1 eq "-E"){
	while(<IN>){
		@hit = $_ =~ /(<${tag}[^<>]*>.*?<\/$tag>)/g;
		foreach $j (@hit) {
			print "$j$op2";
		}
		print "$op3\n"
	}
}else{
	print "unknown option.";
}
close(IN);
