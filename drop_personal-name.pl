#!/usr/bin/perl

# vars
$help = 0;
$check = 0;
$status = 0;
$file = "";
$head = "";
$tail = "";
$ie = 0;

# subroutine
sub _help {
	print "USAGE:\n";
	printf " drop_personal-name.pl h=<file of headings> t=<file of tails> -h -c \n"
}

sub _check {
	print "ARGS:\n";
	print " help:$help:\n";
	print " check:$check:\n";
	print " status:$status:\n";
	print " file:$file:\n";
	print " head:$head:\n";
	print " tail:$tail:\n";
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
	}elsif($l =~ /f=(.*)/){
		$file = $1;
	}elsif($l =~ /h=(.*)/){
		$head = $1;
	}elsif($l =~ /t=(.*)/){
		$tail = $1;
	}else{
		print "unknown:$l:\n";
	}
}

# main
## print help
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
open(IN,$head);
while(<IN>){
	chomp;
	push(@head,$_)
}
close(IN);

open(IN,$tail);
while(<IN>){
	chomp;
	push(@tail,$_);
}
close(IN);


open(IN,$file);
while(<IN>){
	$_ =~ s///g;
	print $_;

}
close(IN);
