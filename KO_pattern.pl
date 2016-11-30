#!/usr/bin/perl

# vars
$help = 0;
$check = 0;
$status = 0;
$spat = "";
$epat = "";
$if = "";
$of = ""; #knock-out part
$ex = ""; #exclude pattern
$ie = 0;

# subroutine
sub _help {
	print "USAGE:\n";
	print " KO_pattern.pl spat=<start pattern> epat=<end pattern> ex=<exclude pattern> if=<input file> of=<output file(KO-part)> -h -c -s \n"
}

sub _check {
	print "ARGS:\n";
	print " help:$help:\n";
	print " check:$check:\n";
	print " status:$status:\n";
	print " spat:$spat:\n";
	print " epat:$epat:\n";
	print " ex:$ex:\n";
	print " if:$if:\n";
	print " of:$of:\n";
}

sub _status {
	print "STATUS:\n";
	printf " Under construction.\n"
}

# argment analysis
foreach $l (@ARGV) {
	if($l eq "-h"){
		$help = 1;
	}elsif($l eq "-c"){
		$check = 1;
	}elsif($l eq "-s"){
		$status = 1;
	}elsif($l =~ /spat=(.*)/){
		$spat = $1;
	}elsif($l =~ /epat=(.*)/){
		$epat = $1;
	}elsif($l =~ /ex=(.*)/){
		$ex = $1;
	}elsif($l =~ /if=(.*)/){
		$if = $1;
	}elsif($l =~ /of=(.*)/){
		$of = $1;
	}else{
		print "unknown:$l:\n";
	}
}

# main
if($help == 1){
	&_help;
	$ie = 1;
}
if($check == 1){
	&_check;
	$ie = 1;
}
if($status == 1){
	&_status;
	$ie = 1;
}
if($ie == 1){
	exit(0);
}

## function
open(OUT,">$of");

open(IN,$if);
if($ex eq ""){
	while(<IN>){
		$_ =~ s/($spat.*?$epat)//g;
		print $_;
		print OUT "$1\n";
	}
close(IN);
}

close(OUT);

# end of code
