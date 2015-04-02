#!/usr/bin/perl

$IN_body = 0;
$CUR_sec = "";
$CUR_p_st = "";
$CUR_p_en = "";
#$CUR_p_lv_st = 0;
#$CUR_p_lv_en = 0;
$prt_st = 0;
$prt_en = 0;
$prt_pop = 0;
$prt_pcl = 0;
$count = 0;
while(<>){
	chomp;
	if($_ =~ /\.\//){
		print "$_\n";
		$prt_st = 0;
		$prt_en = 0;
		$count = 0;
		$prt_pop = 0;
		$prt_pcl = 0;
	}
	if($_ =~ /:s:<body>:/){
		$IN_body = 1;
	}elsif($_ =~ /:e:<\/body>:/){
		$IN_body = 0;
	}
	if($IN_body == 1){
		if($_ =~ /:s:<sec/){
			$CUR_sec = $_;
		}
		if($_ =~ /:s:<p>:/){
			$CUR_p_st = $_;
			#@tmp = split(/\t/,$CUR_p_st);
			#$CUR_p_lv_st = pop(@tmp);
		}
		if($_ =~ /:s:<xref/){
			if($prt_st == 0){
				$count++;
				print "R"."$count\n";
				print "$CUR_sec\n";
				print "$CUR_p_st\n";
				$prt_st = 1;
				$prt_pop = 1;
				$prt_pcl = 0;
			}
			print "$_\t";
			#print "$CUR_p_st\t$_\t";
		}
		if($_ =~ /:e:<\/xref>:/){
			print "$_\n";
			$prt_en = 1;
		}
		if($_ =~ /:e:<\/p>:/){
			$CUR_p_en = $_;
			#@tmp = split(/\t/,$CUR_p_en);
			#$CUR_p_lv_en = pop(@tmp);
			if($prt_en == 1 && $prt_pop == 1){
				print "$CUR_p_en\n";
				$prt_en = 0;
				$prt_pop = 0;
				$prt_pcl = 1;
			}
			$prt_st = 0;
		}
	}
	if($_ =~ /;;;/){
		print "$_\n";
	}
}
