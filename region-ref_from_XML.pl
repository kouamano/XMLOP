#!/usr/bin/perl

while(<>){
	push(@arr,$_);
}
$str = join('',@arr);
$str =~ s/\s/ /ig;
@arr = ();
while($str =~ /(<ref id=[^<>]+?>.*?<\/ref>)/ig){
	push(@arr,$1);
}
foreach(@arr){
	print "\t$_";
}
print "\n";
