#!/usr/bin/perl

$IN_EL = 0;
$IN_MM = 0;
$PREV_IN_MM = 0;
$LEV = 0;
$CURR_START = 0;
$CURR_END = 0;
$name = "";
while(<>){
	chomp;
	$CURR_START = -1;
	$CURR_END = -1;
	$PREV_IN_MM = $IN_MM;
	if($_ =~ /\.\/.*nxml/){
		print "$_\n";
	}elsif($_ eq ';;;'){
		print "$_\n";
	}

	if($_ =~ /[0-9]*\-[0-9]*:<.+\/>/){ # start and end
		;
	}elsif($_ =~ /[0-9]*\-[0-9]*:<[^\/].*[^\/]/){ # start
		$LEV++;
	}elsif($_ =~ /[0-9]*\-[0-9]*:<\/.*>/){ # end
		$LEV--;
	}

	if(($_ =~ /[0-9]*\-([0-9]*):(<sec.*material.*>)/i) || ($_ =~ /[0-9]*\-([0-9]*):(<sec.*method.*>)/i)){
		$CURR_START = ($1) + 1;
		$name = $2;
		$IN_MM = 1;
		print "$name\t$CURR_START\t";
	}elsif($_ =~ /[0-9]*\-[0-9]*:<sec.*>/){ # start sec tag
		if($IN_MM > 0){
			$IN_MM++;
		}
	}elsif($_ =~ /[0-9]*\-[0-9]*:<\/sec/){ # end sec tag
		$IN_MM--;
	}

	#print "[$LEV $IN_MM $PREV_IN_MM]$_\n";
	if($IN_MM == 0 && $PREV_IN_MM > 0){
		$_ =~ /([0-9]*)\-[0-9]*:(.*):/;
		$CURR_END = ($1) - 1;
		$name = $2;
		print "$CURR_END\t$name\n";
	}
}
