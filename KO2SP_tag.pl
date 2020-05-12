#!/usr/bin/perl

while(<>){
	#$_ =~ s/(<[^<>]*>)/ /g;
	$_ =~ s/(<[^<>]*?>)/$sb="";for($i=0;$i<length($1);$i++){$sb=$sb." ";};$sb/eg;
	print $_;
}
