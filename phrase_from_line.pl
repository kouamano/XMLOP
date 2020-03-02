#!/usr/bin/perl
$num = 0;
$file = $ARGV[0];
$num = $ARGV[1];

open(IN,$file);
while(<IN>){
	chomp;
	@line = ();
	@line = split(/\s+/,$_);
	$elms = @line;
	#print "$num $elms\n";
	for($i=0;$i<$elms-$num+1;$i++){
		#print " $i:$i+1";
		for($j=0;$j<$num;$j++){
			print " $line[$i+$j]";
		}
		print "\n";
	}
	print "\n";
}
close(IN);
