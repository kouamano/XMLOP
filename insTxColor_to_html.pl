#!/usr/bin/perl

# vars
$help = 0;
$check = 0;
$status = 0;
$int1 = 0;
$str1 = "";
$ie = 0;

# subroutine
sub _help {
	print "USAGE:\n";
	print " insTxColor_to_html.pl src=<src file> clm=<column> trm=<termlist file> clr=<color> .\n";
	print " <column>: column # of src file; start at 0; sep:TAB; the targets are the columns after # .\n";
	print " <termlist file>: escaped term list.\n";
}

sub _check {
	print "ARGS:\n";
	print " help:$help:\n";
	print " check:$check:\n";
	print " status:$status:\n";
	print " src:$src:\n";
	print " trm:$trm:\n";
	print " clm:$clm:\n";
	print " clr:$clr:\n";
}

sub _status {
	print "STATUS:\n";
	printf " under construction.\n"
}

# argment analysis
foreach $l (@ARGV) {
	if($l eq "-h"){
		$help = 1;
	}elsif($l eq "-c"){
		$check = 1;
	}elsif($l eq "-s"){
		$status = 1;
	}elsif($l =~ /src=(.*)/){
		$src = $1;
	}elsif($l =~ /trm=(.*)/){
		$trm = $1;
	}elsif($l =~ /clm=(.*)/){
		$clm = $1;
	}elsif($l =~ /clr=(.*)/){
		$clr = $1;
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
	chomp;
	@linearr = split(/\t/,$_);
	$numofclm = @linearr;
	###対象外カラムのprint・shift
	for($i=0;$i<$clm;$i++){
		$out = shift(@linearr);
		print "$out\t";
	}
	###join
	$tgt = join("\t",@linearr);
	###処理
	$tgt = " $tgt ";
	foreach(@termlist){
		$tgt =~ s/([ \.,:;\/\?\-\^\(\[>])($_)([ \.,:;\/\?\-\^\)\]<])/$1<font color="$clr">$2<\/font>$3/g
	}
	$tgt =~ s/^ +//;
	$tgt =~ s/ +$//;
	print "$tgt";
	print "\n";
}
close(IN);

