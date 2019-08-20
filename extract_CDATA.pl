#!/usr/bin/perl
@arr = ();
while(<>){
	push(@arr,$_);
}
$tx = join("",@arr);
$tx =~ s/\s/ /g;
#while($tx =~ /(<!\[CDATA\[.*?(?!.*\]\]>).*?\]\]>)/g){
while($tx =~ /(<!\[CDATA\[.*?\]\]>)/g){
	print "$1\n";
	#print "$2";
}
