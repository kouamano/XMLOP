#!/usr/bin/perl

while(<>){
	push(@arr,$_);
}
$tx = join("",@arr);
while($tx =~ /(<[^<>]*[^<>\/]>)/ig){
	$p = pos($tx);
	$l = length($1);
	$s = $p-$l;
	$e = $p-1;
	print "$s-$e:s:$1:\n";
}
print ";;\n";
while($tx =~ /(<\/[^<>]*>)/ig){
	$p = pos($tx);
	$l = length($1);
	$s = $p-$l;
	$e = $p-1;
	print "$s-$e:e:$1:\n";
}
print ";;;\n";
