#!/usr/bin/perl

# vars
$help = 0;
$check = 0;
$status = 0;
$tag = "";
$if = "";
$of = "";
$ex = 1; #exclude other tags
$ie = 0;

# subroutine
sub _help {
	print "USAGE:\n";
	printf " KO_element.pl tag=<tag> if=<input file> of=<output file(KO-part)> -e|-E -h -c -s \n"
}

sub _check {
	print "ARGS:\n";
	print " help:$help:\n";
	print " check:$check:\n";
	print " status:$status:\n";
	print " tag:$tag:\n";
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
	}elsif($l eq "-e"){
		$ex = 1;
	}elsif($l eq "-E"){
		$ex = 0;
	}elsif($l =~ /tag=(.*)/){
		$tag = $1;
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

if($ex == 0){ # -E
	open(IN,$if);
	while(<IN>){
		$_ =~ s/(<$tag>[^<>]*?<\/$tag>)//g;
		#$_ =~ s/<$tag>.*?<\/$tag>//g;
		print $_;
		print OUT "$1\n"
	}
	close(IN);
}elsif($ex == 1){ # -e
	open(IN,$if);
	while(<IN>){
		#$_ =~ s/<$tag>[^<>]*?<\/$tag>//g;
		$_ =~ s/<$tag>.*?<\/$tag>//g;
		print $_;
		print "$1\n"
	}
	close(IN);
}

close(OUT);


