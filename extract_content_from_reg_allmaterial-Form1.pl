#!/usr/bin/perl

$dir = $ARGV[0];
@arr = ();
$fnaem = "";
$reg_start = "";
$reg_end = "";
while(<>){
	if($_ =~ /;;;/){
		$fname = shift(@arr);
		$fname =~ s/^\.\///;
		$fname = $dir."/".$fname;
		print $fname;
		foreach(@arr){
			if($_ =~ /REGION_START\n$/i){
				#print $_;
				$_ =~ s/^([0-9]+)-.*//;
				$reg_start = $1;
				#print "$reg_start-";
			}elsif($_ =~ /REGION_END\n$/i){
				$_ =~ s/^[0-9]+-([0-9]+).*//;
				$reg_end = $1;
				$reg = "$reg_start-$reg_end";
				print "SPAN	$reg\n";
				$com = "streamcut if=\'$fname\' span=$reg\n";
				$res = `$com`;
				$res =~ s/\s/ /;
				print "CONTENT	$res";
				$reg_start = "";
				$reg_end = "";
				$res = "";
			}
		}
		print ";;;\n";
		@arr = ();
	}else{
		push(@arr,$_);
	}
}
