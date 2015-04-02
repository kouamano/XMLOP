#!/usr/bin/perl

while(<>){
	push(@arr,$_);
}
$astr = join('',@arr);
@arr = split(/;;;\t0\n/,$astr);
pop(@arr);
$count = 0;
foreach(@arr){
	print "[$count]";
	#print "$_\n";
	@brr = split(/\n/,$_);
	$head = shift(@brr);
	$head =~ s/\t0$//;
	print "$head\n";
	foreach(@brr){
		if($_ =~ /^R[0-9]+/){
			print "$_<p> sub ";
		}
		if($_ =~ /:s:<sec/){
			$_ =~ s/\t[0-9]*$//;
			print "$_:";
		}
		if($_ =~ /:s:<p>:/){
			$_ =~ /^([0-9]+)/;
			print "$1-";
		}
		if($_ =~ /:e:<\/p>:/){
			$_ =~ /-([0-9]+):/;
			print "$1\n";
		}
	}
	print ";;;\n";
	$count++;
	@brr = ();
}
