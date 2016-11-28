#!/usr/bin/perl

$tag = $ARGV[0];
$f = $ARGV[1];
$op1 = $ARGV[2]; #Excluding other tag

open(IN,$f);
if($op1 eq "-e"){
	while(<IN>){
		$_ =~ s/<$tag>[^<>]*?<\/$tag>//g;
		print $_;
	}
}elsif($op1 eq "-E"){
	while(<IN>){
		$_ =~ s/<$tag>*?<\/$tag>//g;
		print $_;
	}
}else{
	print "unknown option: $op1 \n";
}
close(IN);
