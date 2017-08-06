#!/usr/bin/perl
use utf8;
use HTML::Entities;

# vars
$help = 0;
$check = 0;
$status = 0;
$i = 0;
$n = 0;
$ie = 0;

# subroutine
sub _help {
	print "DESCRIPTION:\n";
	print " insDescription_to_html.pl inserts tag into xml file with no-separator.\n";
	print "USAGE:\n";
	print " insDescription_to_html.pl src=<src file> trm=<term list file> col=<search object column of trm> tag=<tag name> [-i] [-n] .\n";
	print " <column>: column # of src file; start at 0; sep:TAB; the targets are the columns after # .\n";
	print " <term list file>: escaped term list.\n";
	print " -i: ignore case.\n";
	print " -n: use ncr as property value.\n";
}

sub _check {
	print "ARGS:\n";
	print " help:$help:\n";
	print " check:$check:\n";
	print " status:$status:\n";
	print " src:$src:\n";
	print " trm:$trm:\n";
	print " col:$col:\n";
	print " tag:$tag:\n";
	print " cap ignore:$i:\n";
	print " ncr:$n:\n";
}

sub _status {
	print "STATUS:\n";
	printf " testing.\n"
}

# argment analysis
foreach $l (@ARGV) {
	if($l eq "-h"){
		$help = 1;
	}elsif($l eq "-c"){
		$check = 1;
	}elsif($l eq "-s"){
		$status = 1;
	}elsif($l eq "-i"){
		$i = 1;
	}elsif($l eq "-n"){
		$n = 1;
	}elsif($l =~ /src=(.*)/){
		$src = $1;
	}elsif($l =~ /trm=(.*)/){
		$trm = $1;
	}elsif($l =~ /col=(.*)/){
		$col = $1;
	}elsif($l =~ /tag=(.*)/){
		$tag = $1;
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

##term list
open(IN,$trm);
while(<IN>){
	chomp;
	push(@termlist,$_);
}
close(IN);

##src file operation
open(IN,$src);
while(<IN>){
	$line = $_;
	#print "$line";
	foreach(@termlist){
		@tarr = split(/\t/,$_);
		$sterm = $tarr[$col];
		delete($tarr[$col]);
		$desc = join(' ',@tarr);
		if($n == 1){
			#$desc =~ s/(.)/sprintf '&#x%x;', ord($1)/eg;
			#$desc = encode_entities($desc);
			$desc = encode_entities($desc,q{<>/'"&#});
		}
		#print "$tarr[$col]\n";
		if($i == 0){
			$line =~ s/(.*? |^)($sterm)([ ,;.].*?)/$1<$tag desc="$desc">$2<\/$tag>$3/g;
		}else{
			$line =~ s/(.*? |^)($sterm)([ ,;.].*?)/$1<$tag desc="$desc">$2<\/$tag>$3/ig;
		}
	}
	print "$line";
}
close(IN);

