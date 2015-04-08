#!/usr/bin/perl

$dir = $ARGV[0];
@arr = ();
#@brr = ();
$count = 0;
$head_count = 0;
$tail_count = 0;
while(<>){
	if($_ =~ /;;;/){
		$fname = shift(@arr);
		$fname =~ s/^\.\///;
		$fname =~ s/\t[0-9]+$//;
		$fname = $dir."/".$fname;
		print $fname;
		$count = 0;
		foreach(@arr){
			#print "+++$_";
			#@brr = ();
			#$head_count = 0;
			#$tail_count = 0;
			$count++;
			if($_ =~ /^ \[/){
				$head = $_;
				$head_count = 1;
				$tail_count = 0;
				#print "HEAD:$head_count $head";
				#print "HEAD:$head:=\n";
			#}elsif($_ =~ /:s:<xref/){
				#push(@brr,$_);
			}elsif($_ =~ /^[0-9]+-[0-9]+:e:<\//){
				#print "$head_count $tail_count\n";
				if($head_count == 1 && $tail_count == 0){
					$tail = $_;
					$tail_count++;
					$tail =~ s/\t;;\n$//;
					$tail =~ s/\t([0-9]+)$//;
					$tail_lv = $1;
					#print "HEAD:$head:\n";
					@head = split(/\t/,$head);
					$pair_h = $head[$tail_lv];
					$pair_h =~ s/ \[[0-9]+\]$//;
					print "PAIR\t$pair_h";
					print "\t$tail\n";
					print "LV\t$tail_lv\t$head\n";
					$pair_h =~ /^([0-9]+)-/;
					$region_s = $1;
					$tail =~ /^[0-9]+-([0-9]+)/;
					$region_e = $1;
					$reg = "$region_s"."-"."$region_e";
					#print "REGION-xref-upper\t$reg\n";
					$com= "streamcut if=\'$fname\' span=$reg\n";
					#print $com;
					$res = `$com`;
					$res =~ s/\s/ /g;
					print "CONTENTS('\\s'->' ')\t$res";
					print "\n;;\n";
					
				}
			}
			#print "[[[$count]]]$_";
		}
		print ";;;\n";
		@arr = ();
	}else{
		push(@arr,$_);
	}
}
#$sarr = join('',@arr);
#@arr = split(/;;;\t0\n/,$sarr);
#foreach(@arr){
#	$_ =~ s/^([^\n]+)\t0\n//;
#	$fname = $1;
#	$fname =~ s/^\.\///;
#	print "$dir/$fname\n";
#	#print "$_";
#	@brr = split(/;;\n/,$_);
#	#$count = @brr;
#	#print "ELM:$count:\n";
#	foreach(@brr){
#		if($_ =~ /^ \[/){
#			#print "$_;;\n";
#			$_ =~ s/^([^\n]+)\n//;
#			$head = $1;
#			print "$head\n";
#			$_ =~ s/\n([^\n]+)$//;
#			$tail = $1;
#			print "$tail\n";
#		}
#	}
#	print "\n;;;\n";
#}
