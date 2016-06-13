#!/usr/bin/perl

#imformation level
$op = $ARGV[1];

#input file
$fname = $ARGV[0];
if($fname =~ /^\//){
	print "$fname\n";
}elsif($fname =~ /\.\//){
	print "$fname\n";
}else{
	print "./$fname\n";
}


open(IN,$fname);
while(<IN>){
	push(@arr,$_);
}
close(IN);

$tx = join("",@arr);
$tx =~ s/\s/ /g;
$tx =~ s/(<!--.*?-->)/$count=0;$sb="";while($count < length($1)){$sb = $sb." "; $count++;};$sb/eg;
@arr = ();
$lv = 0;
@stack = ();
while($tx =~ /(<[^<>]*[^\/]{0,1}>)/ig){
	$p = pos($tx);
	$target = $1;

	#(stack operation
	$msg = "";
	$stk = "";
	$cls = "";
	$current = "";
	#print "::: $target :::";
	if($target =~ /.*\/>/){
		#print "match";
	}elsif($target =~ /(^<[^\/!\?][^\s>]*)/){
		$stk = $1;
		$stk =~ s/^<//;
		push(@stack,$stk);
		if($op == 2){
			$hier = join("/",@stack);
			$msg = $hier;
		}
	}elsif($target =~ /(^<\/[^\s>]+)/){
		$cls = $1;
		$cls =~ s/^<\///;
		$current = pop(@stack);
		if($current == $cls){
			if($op == 1){
				$msg = "T:";
			}elsif($op == 2){
				$hier = join("/",@stack);
				$msg = "T: /$hier/";
			}
		}else{
			if($op == 1){
				$msg = "F: $current";
			}elsif($op == 2){
				$hier = join("/",@stack);
				$msg = "F: /$hier/".": $current";
			}
		}
	}
	#)

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
	}elsif($target =~ /^<\/>$/){
		push(@arr,"$s"."-"."$e".":"."n".":$target:\n");
	}elsif($target =~ /^<\//){
		push(@arr,"$s"."-"."$e".":"."e".":$target:\t$lv\t$msg\n");
		$lv--;
	}elsif($target =~ /^<[^<>]+\/>$/){
		push(@arr,"$s"."-"."$e".":"."a".":$target:\n");
	}elsif($target =~ /^<[^<>\/][^<>]*>$/){
		$lv++;
		push(@arr,"$s"."-"."$e".":"."s".":$target:\t$lv\t$msg\n");
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
