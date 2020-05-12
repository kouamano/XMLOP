#!/usr/bin/perl
$KO_char = "X";
while(<>){
	push(@arr,$_);
}
$arr = join("",@arr);
$arr =~ s/(>)([^<>]*)(<)/$count=0;$sb=">";while($count < length($2)){$sb = $sb.$KO_char;$count++;};$sb=$sb."<";$sb/eg;
print $arr;
