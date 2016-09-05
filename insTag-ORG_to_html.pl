#!/usr/bin/perl

$srcfile=$ARGV[0];
$orgfile=$ARGV[1];

open(IN,$orgfile);
while(<IN>){
	chomp;
	push(@orgarr,$_);
}
close(IN);

#print @orgarr;

open(IN,$srcfile);
while(<IN>){
	$ln = $_;
	foreach(@orgarr){
		$ln =~ s/([\s\(>])($_)([\s,;\.\)<])/$1<ORG>$2<\/ORG>$3/g;
		#$ln =~ s/([\s\(])($_)([\s,;\.\)])/$1<ORG>$2<\/ORG>$3/g;
	}
	print $ln;
}
close(IN);
