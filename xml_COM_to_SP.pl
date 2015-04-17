#!/usr/bin/perl

while(<>){
	push(@arr,$_);
}
$tx = join('',@arr);
$tx =~ s/\s/ /g;
#print "$tx\n";
$tx =~ s/(<!--.*?-->)/$count=0;$sb="";while($count < length($1)){$sb = $sb." "; $count++;};$sb/eg;
#print "++++++\n";
#print "$tx\n";
print "$tx";
#while(<>){
#	$_ =~ s/(<!--.*-->)/$count=0;while($count < length($1)){print " "; $count++;}/eg;
#	print $_;
#}
