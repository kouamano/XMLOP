#!/usr/bin/perl

$str = $ARGV[0];
$fname = $ARGV[1];

open(IN,$fname);

while(<IN>){
	push(@arr,$_);
}
$all = join("",@arr);
@all = split("\n;;;\n",$all);
#$count = @all;
#print ":${count}:\n";
foreach $l (@all){
	$hit = 0;
	@pt = ();
	@pt = split(/\n/,$l);
	#$count = @pt;
	@stack = ();
	foreach(@pt){
		if($_ =~ /$str/){
			#print "$_";
			push(@stack,$_);
		}
	}
	$hc = @stack;
	if($hc != 0){
		print "$pt[0]\n";
		#print ":::${hc}:::\n";
		#print @stack;
		foreach(@stack){
			chomp;
			print "$_\n";
		}
		print ";;;\n";
	}
}

close(IN);
