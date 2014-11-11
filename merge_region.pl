#!/usr/bin/perl

# vars
$help = 0;
$check = 0;
$status = 0;
$ie = 0;
@files = ();
@allcont = ();

# subroutine
sub _help {
	print "USAGE:\n";
	printf " merge_region if=<file1> if=<file2>\n"
}

sub _check {
	print "ARGS:\n";
	print " help:$help:\n";
	print " check:$check:\n";
	print " status:$status:\n";
	print " files:@files:\n";
}

sub _status {
	print "STATUS:\n";
	printf " Under construction.\n"
}

# argment analysis
foreach $l (@ARGV) {
	if($l eq "-h"){
		$help = 1;
	}elsif($l eq "-c"){
		$check = 1;
	}elsif($l eq "-s"){
		$status = 1;
	}elsif($l =~ /if=(.*)/){
		$fl = $1;
		push(@files,$fl);
	}else{
		print "unknown:$l:\n";
	}
}

# main
if($help == 1){
	&_help;
	$ie = 1;
}
if($check == 1){
	&_check;
	$ie = 1;
}
if($status == 1){
	&_status;
	$ie = 1;
}
if($ie == 1){
	exit(0);
}

##open files
$num = @files;
#print "$num\n";
foreach(@files){
	$fn = $_;
	#print $fn;
	@arr = ();
	open(IN,$fn);
	while(<IN>){
		#print $_;
		push(@arr,$_);
	}
	close(IN);
	$astr=join('',@arr);
	push(@fcont,$astr);
}
##insert to matrix
#print $fcont[0];
$fcount = 0;
foreach(@fcont){
	@arr = ();
	@arr = split(";;;",$_);
	$lcount = 0;
	foreach(@arr){
		#print "f:$fcount l:$lcount\n";
		$allcont[$lcount][$fcount] = $_;
		$lcount++;
	}
	$fcount++;
}
#print "$lcount\n";
print "0\n";
print $allcont[18][0];
print "1\n";
print $allcont[18][1];
print "\n++++++++\n";
for($i=0;$i<$lcount;$i++){
	@arr = ();
	for($j=0;$j<$fcount;$j++){
		print "[$i][$j]\n";
		print "$allcont[$i][$j]\n";
		@tmp = split("\n",$allcont[$i][$j]);
		shift(@tmp);
		push(@arr,@tmp);
	}
	print "\n -> [[[ @arr ]]]";
	@maparr = map {(split(":",$_))[1]} @arr;
	print "\n -> [[[ @maparr ]]]";
	@srtmaparr = sort {$a <=> $b} @maparr;
	print "\n -> [[[ @srtmaparr ]]]\n";
	#Under construction
}



