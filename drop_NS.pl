#!/usr/bin/perl
while(<>){
	$_ =~ s/xmlns=/ignore=/i;
	$_ =~ s/\<(\/{0,1})[^>:\s]*?:/\<$1/g;
	print $_;
}
