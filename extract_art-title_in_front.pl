#!/usr/bin/perl
while(<>){
	push(@arr,$_);
}
$art = join('',@arr);
$art =~ s/\s/ /g;
$art =~ /(<front>.*?<\/front>)/ig;
$front = $1;
$front =~ /(<article-title>.*?<\/article-title>)/ig;
$title = $1;
print $title;
#while(<>){
#	@fitfront = $_ =~ /(<front>.*?<\/front>)/ig;
#}
#print @fitfront;
#while(<>){
#	@hit = $_ =~ /(<article-title>.*?<\/article-title>)/ig;
#	foreach $j (@hit) {
#		print "$j\n";
#	}
#}
