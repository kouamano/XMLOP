#!/usr/bin/perl

$dir = $ARGV[0];
$file = $ARGV[1];

open(IN,$file);
while(<IN>){
	#print $_;
	push(@arr,$_);
}
close(IN);

$sarr = join("",@arr);
@arr = split(";;;",$sarr);
pop(@arr);

foreach(@arr){
	#print "$_";
	$_ =~ s/^\s+//;
	$_ =~ s/\s+$//;
	@line = split("\n",$_);
	$title = shift(@line);
	$title =~ s/^\[[0-9]*\]\.//;
	$fname = "$dir"."$title";
	print "$fname";
	foreach(@line){
		chomp;
		#print $_;
		$reg = (split(":",$_))[1];
		$com= "streamcut if=\'$fname\' span=$reg\n";
		$res = `$com`;
		$res =~ s/\s/ /ig;
		print "\t$res";
	}
	print "\n";
}
