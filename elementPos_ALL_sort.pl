#!/usr/bin/perl

while(<>){
	push(@arr,$_);
}
$tx = join("",@arr);
$tx =~ s/\s/ /g;
@arr = ();
while($tx =~ /(<[^<>\/!\?][^<>]*[^\/]{0,1}>)/ig){
	$p = pos($tx);
	$target = $1;
	$l = length($target);
	$s = $p-$l;
	$e = $p-1;
	#print "$s-$e:s:$1:\n";
	if($target =~ /\/>$/){
		push(@arr,"$s-$e:a:$target:\n");
	}else{
		push(@arr,"$s-$e:s:$target:\n");
	}
}
#print ";;\n";
while($tx =~ /(<\/[^<>]*>)/ig){
	$p = pos($tx);
	$l = length($1);
	$s = $p-$l;
	$e = $p-1;
	#print "$s-$e:e:$1:\n";
	push(@arr,"$s-$e:e:$1:\n");
}
#while($tx =~ /(<[^<>\/!]*\/>)/ig){
#	$p = pos($tx);
#	$l = length($1);
#	$s = $p-$l;
#	$e = $p-1;
#	#print "$s-$e:b:$1:\n";
#	push(@arr,"$s-$e:b:$1:\n");
#}
#print ";;;\n";
@arr = sort {$a <=> $b} @arr;
print @arr;
print ";;;\n";
