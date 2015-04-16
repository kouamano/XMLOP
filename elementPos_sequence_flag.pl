#!/usr/bin/perl

$fname = $ARGV[0];
if($fname =~ /^\//){
	print "$fname\n";
}elsif($fname =~ /\.\//){
	print "$fname\n";
}else{
	print "./$fname\n";
}

while(<>){
	push(@arr,$_);
}
$tx = join("",@arr);
$tx =~ s/\s/ /g;
@arr = ();
while($tx =~ /(<[^<>]*[^\/]{0,1}>)/ig){
	$p = pos($tx);
	$target = $1;
	$l = length($target);
	$s = $p-$l;
	$e = $p-1;
	#push(@arr,"$s"."-"."$e"."::$target:\n");
	if($target =~ /^<!/){
		push(@arr,"$s"."-"."$e".":"."i".":$target:\n");
	}elsif($target =~ /^<\?/){
		push(@arr,"$s"."-"."$e".":"."i".":$target:\n");
	}elsif($target =~ /^<>$/){
		push(@arr,"$s"."-"."$e".":"."n".":$target:\n");
	}elsif($target =~ /^<\//){
		push(@arr,"$s"."-"."$e".":"."e".":$target:\n");
	}elsif($target =~ /^<[^<>\/]+\/>$/){
		push(@arr,"$s"."-"."$e".":"."a".":$target:\n");
	}elsif($target =~ /^<[^<>\/][^<>]*>$/){
		push(@arr,"$s"."-"."$e".":"."s".":$target:\n");
	}else{
		push(@arr,"$s"."-"."$e".":"."o".":$target:\n");
	}
	#if($target =~ /\/>$/){
	#	push(@arr,"$s-$e:a:$target:\n");
	#}else{
	#	push(@arr,"$s-$e:s:$target:\n");
	#}
}
print @arr;
print ";;;\n";
