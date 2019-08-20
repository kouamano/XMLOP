#!/usr/bin/perl
@arr = ();
while(<>){
	push(@arr,$_);
}
$tx = join("",@arr);
$tx =~ s/\s/ /g;
#while($tx =~ /(<!\[CDATA\[.*?(?!.*\]\]>).*?\]\]>)/g){
while($tx =~ /(<!\[CDATA\[.*?\]\]>)/g){
	$p = pos($tx);
	$l = length($1);
	$s = $p-$l;
	print "$s:$p\t$1\n";
	#print "$2";
}
