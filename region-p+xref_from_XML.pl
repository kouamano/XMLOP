#!/usr/bin/perl

while(<>){
	push(@arr,$_);
}
$str = join('',@arr);
$str =~ s/\s/ /ig;
@arr = ();
while($str =~ /(<p>.*?<xref.*?>.*?<\/xref>.*?<\/p>)/ig){
	print "$1\n";
}
