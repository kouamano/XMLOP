#!/usr/bin/perl

while(<>){
	$_ =~ s/(<[^<>]*>)/sprintf("<%s>",length($1))/eg;
	#$_ =~ s/<([^<>]*)>/for($i=0;$i<length($1);$i++){sprintf("*")}/eg;
	print $_;
}
