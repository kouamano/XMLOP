#!/usr/bin/perl

$PREV_REG = 0;
$IN_REG = 0;
$LEVEL = 0;
while(<>){
	chomp;
	$PREV_REG = $IN_REG;
	if($_ =~ /^\./){
		$PREV_REG = 0;
		$IN_REG = 0;
		$LEVEL = 0;
		print "$_\n";
	}
	if($_ =~ /;;;/){
		$PREV_REG = 0;
		$IN_REG = 0;
		$LEVEL = 0;
		print "$_\n";
	}
	if($_ =~ /^[0-9].*:s:(<.*material.*>)/){
		if($IN_REG >= 1){
		$LEVEL = $LEVEL + 1;
		}else{
		$IN_REG = 1;
		$LEVEL = 1;
		}
		$tag = $1;
		@tmp = split(/ /,$tag);
		#$tagname = shift(@tmp);
		#$tagname =~ s/^<//;
		#$tagname = "</".$tagname;
		#print "$_ : $IN_REG/$LEVEL === $tagname\n";
	}elsif($IN_REG > 0 && $_ =~ /^[0-9].*:s:.*/){
		$LEVEL = $LEVEL + 1;
	}elsif($IN_REG > 0 && $_ =~ /^[0-9].*:e:.*/){
		$LEVEL = $LEVEL - 1;
	}
	if($LEVEL <= 0){
		$IN_REG = 0;
	}
	#print "$_ $LEVEL/$IN_REG/prev:$PREV_REG\n";
	if($LEVEL == 1 && $IN_REG == 1 && $PREV_REG == 0){
		print "$_ REGION_START\n"
	}elsif($LEVEL == 0 && $IN_REG == 0 && $PREV_REG == 1){
		print "$_ REGION_END\n"
	}
}
