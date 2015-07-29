#!/usr/bin/perl

while(<>){
	#$_ =~ s/(<[^<>]*>)/ /g;
	$_ =~ s/<([^<>]*)>/for($i=0;$i<length($1);$i++){sprintf("%s"," ")}/eg;
	print $_;
}
