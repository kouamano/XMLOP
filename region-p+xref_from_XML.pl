#!/usr/bin/perl

while(<>){
	push(@arr,$_);
}
$str = join('',@arr);
$str =~ s/\s/ /ig;
@arr = ();
#while($str =~ /(<p>.*?<xref.*?>.*?<\/xref>.*?<\/p>)/ig){
while($str =~ /(<p>.*?<\/p>)/ig){
	push(@arr,$1);
}
#print @arr;
foreach(@arr){
	if($_ =~ /xref/){
		print "$_\n";
	}
}
