#!/usr/bin/perl

while(<>){
	push(@arr,$_);
}
$tx = join("",@arr);
@arr = ();
while($tx =~ /(<[^<>\/!\?][^<>]*[^\/]>)/ig){
	$p = pos($tx);
	$l = length($1);
	$s = $p-$l;
	$e = $p-1;
	#print "$s-$e:s:$1:\n";
	push(@arr,"$s-$e:s:$1:\n");
}
#print ";;\n";
while($tx =~ /(<\/[^<>!]*>)/ig){
	$p = pos($tx);
	$l = length($1);
	$s = $p-$l;
	$e = $p-1;
	#print "$s-$e:e:$1:\n";
	push(@arr,"$s-$e:e:$1:\n");
}
while($tx =~ /(<[^<>\/!\?][^<>]*\/>)/ig){
	$p = pos($tx);
	$l = length($1);
	$s = $p-$l;
	$e = $p-1;
	#print "$s-$e:b:$1:\n";
	push(@arr,"$s-$e:b:$1:\n");
}
#print ";;;\n";
@arr = sort {$a <=> $b} @arr;
print @arr;
print ";;;\n";
