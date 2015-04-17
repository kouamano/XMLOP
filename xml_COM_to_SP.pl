#!/usr/bin/perl

while(<>){
	push(@arr,$_);
}
$tx = join('',@arr);
$tx =~ s/\s/ /;
$tx =~ s/(<!--.*-->)/$count=0;$sb="";while($count < length($1)){$sb = $sb." "; $count++;};$sb/eg;
print $tx;
#while(<>){
#	$_ =~ s/(<!--.*-->)/$count=0;while($count < length($1)){print " "; $count++;}/eg;
#	print $_;
#}
