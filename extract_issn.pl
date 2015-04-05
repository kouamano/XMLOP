#!/usr/bin/perl

@arr = ();
while(<>){
	push(@arr,$_);
	#$_ =~ s/<\/issn>/<\/issn>\n/g;
	#if($_ =~ /<issn[^<>]*>([^<>]+)<\/issn>/g){
	#	print "$1\n";
	#}
}
$sarr = join('',@arr);
$arr =~ s/\s/ /g;
$sarr =~ s/<\/issn>/<\/issn>\n/g;
@arr = split(/\n/,$sarr);
foreach(@arr){
	if($_ =~ /<issn[^<>]*>([^<>]+)<\/issn>/){
		print "\t$1";
	}
}
print "\n";
