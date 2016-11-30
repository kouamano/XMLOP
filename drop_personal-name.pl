#!/usr/bin/perl

# vars
$help = 0;
$check = 0;
$status = 0;
$file = "";
$head = "";
$tail = "";
$tag = 1;
$ie = 0;

# subroutine
sub _help {
	print "USAGE:\n";
	print " drop_personal-name.pl h=<file of headings> t=<file of tails> -t|-T -h -c \n";
	print "OPTION:\n";
	print " -h : help\n";
	print " -c : option check\n";
	print " -t : with DEL tag\n";
	print " -T : just delete\n";
}

sub _check {
	print "ARGS:\n";
	print " help:$help:\n";
	print " check:$check:\n";
	print " status:$status:\n";
	print " file:$file:\n";
	print " head:$head:\n";
	print " tail:$tail:\n";
	print " tag:$tag:\n";
}

sub _status {
	print "STATUS:\n";
	printf " Available.\n"
}

# argment analysis
foreach $l (@ARGV) {
	if($l eq "-h"){
		$help = 1;
	}elsif($l eq "-c"){
		$check = 1;
	}elsif($l eq "-s"){
		$status = 1;
	}elsif($l eq "-t"){
		$tag = 1;
	}elsif($l eq "-T"){
		$tag = 0;
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
	$tx = "\(?:".$_."\)";
	push(@head,$tx);
}
close(IN);
$h_list = join('|',@head);
#print $h_list;

open(IN,$tail);
while(<IN>){
	chomp;
	$tx = "\(?:".$_."\)";
	push(@tail,$tx);
}
close(IN);
$t_list = join('|',@tail);
#print $t_list;


open(IN,$file);
if($tag == 1){
	while(<IN>){
		$_ =~ s/($h_list)(.*?) ($t_list)/<DEL>$1$2<\/DEL> $3/g;
		#$_ =~ s/($h_list)(.*?) ($t_list)/ $3/g;
		print $_;
	}
}else{
	while(<IN>){
		#$_ =~ s/($h_list)(.*?) ($t_list)/<DEL>$1$2<\/DEL> $3/g;
		$_ =~ s/($h_list)(.*?) ($t_list)/ $3/g;
		print $_;
	}
}
close(IN);



# end of code
