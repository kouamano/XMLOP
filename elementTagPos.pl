#!/usr/bin/perl

$fname = $ARGV[0];
if($fname =~ /^\//){
	print "$fname\n";
}elsif($fname =~ /\.\//){
	print "$fname\n";
}else{
	print "./$fname\n";
}

$lv = 0;
while(<>){
	push(@arr,$_);
}
$tx = join("",@arr);
$tx =~ s/\s/ /g;
$tx =~ s/(<!--.*?-->)/$count=0;$sb="";while($count < length($1)){$sb = $sb." "; $count++;};$sb/eg;
@arr = ();
while($tx =~ /(<[^<>]*[^\/]{0,1}>)/ig){
	$p = pos($tx);
	$target = $1;
	$l = length($target);
	$s = $p-$l;
	$e = $p-1;
	#push(@arr,"$s"."-"."$e"."::$target:\n");
	if($target =~ /^<!/){
		push(@arr,"$s"."-"."$e".":"."i"."\t:$target:\n");
	}elsif($target =~ /^<\?/){
		push(@arr,"$s"."-"."$e".":"."i"."\t:$target:\n");
	}elsif($target =~ /^<>$/){
		push(@arr,"$s"."-"."$e".":"."n"."\t:$target:\n");
	}elsif($target =~ /^<\/>$/){
		push(@arr,"$s"."-"."$e".":"."n"."\t:$target:\n");
	}elsif($target =~ /^<\//){
		push(@arr,"$s"."-"."$e".":"."e"."\t:$target:\t$lv\n");
		$lv--;
	}elsif($target =~ /^<[^<>]+\/>$/){
		push(@arr,"$s"."-"."$e".":"."a"."\t:$target:\n");
	}elsif($target =~ /^<[^<>\/][^<>]*>$/){
		$lv++;
		push(@arr,"$s"."-"."$e".":"."s"."\t:$target:\t$lv\n");
	}else{
		push(@arr,"$s"."-"."$e".":"."o"."\t:$target:\n");
	}
	#if($target =~ /\/>$/){
	#	push(@arr,"$s-$e:a:$target:\n");
	#}else{
	#	push(@arr,"$s-$e:s:$target:\n");
	#}
}
print @arr;
print ";;;\n";
