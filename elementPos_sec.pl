#!/usr/bin/perl

while(<>){
	push(@arr,$_);
}
$tx = join("",@arr);
#print $tx;
while($tx =~ /(<sec[^<>]*>)/ig){
#while($tx =~ /(<sec sec-type=[^<>]*material[^<>]*>.*?<\/sec>)/ig){
#while($tx =~ /(\<sec sec-type=[^<>]*material[^<>]*>[^<>]*<\/sec>)/ig){
	$m = "";
	$p = pos($tx);
	$l = length($1);
	$s = $p-$l;
	$e = $p-1;
	#if($1 =~ /material/ig){$m="M";}
	#if($1 =~ /method/ig){$t="T";}
	$1 =~ /(sec-type=\"[^\"]\")/ig;
	print "$s-$e:s:$1:\n";
}
print ";;\n";
#print $tx;
while($tx =~ /(<\/sec>)/ig){
	$p = pos($tx);
	$l = length($1);
	$s = $p-$l;
	$e = $p-1;
	print "$s-$e:e:\n";
}
print ";;;\n";
