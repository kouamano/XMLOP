#!/usr/bin/perl

$srcfile=$ARGV[0];
$patfile=$ARGV[1];
$tag="KW";
$tag=$ARGV[2];

open(IN,$patfile);
while(<IN>){
	chomp;
	$_ =~ s/[^\s]+\t//;
	push(@patarr,$_);
}
close(IN);

#print @patarr;

open(IN,$srcfile);
while(<IN>){
	$ln = $_;
	foreach(@patarr){
		$ln =~ s/([\s\(>])($_)([\s,;\.\)<])/$1<$tag>$2<\/$tag>$3/g;
		#$ln =~ s/([\s\(])($_)([\s,;\.\)])/$1<ORG>$2<\/ORG>$3/g;
	}
	print $ln;
}
close(IN);
