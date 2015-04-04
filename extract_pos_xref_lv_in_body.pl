#!/usr/bin/perl

@cur_tag_lv = ();
@prev_tag_lv = ();
@cur_end_tag_lv = ();
@prev_end_tag_lv = ();
$IN_body = 0;
$print_end_xerf = 0;
$print_over_end_xref = 0;
$print_anyend_tag = 0;
$upper_sec = "";
$print_sec = 0;
$print_hierar = 0;
$lv_count = 0;
while(<>){
	chomp;
	if($_ =~ /^\.\//){
		$IN_body = 0;
		@cur_tag_lv = ();
		@prev_tag_lv = ();
		@cur_end_tag_lv = ();
		@prev_end_tag_lv = ();
		$print_end_xref = 0;
		$print_over_end_xref = 0;
		$upper_sec = "";
		$print_sec = 0;
		$print_hierar = 0;
		print "$_\n";
	}
	if($_ =~ /:s:<body>:/){
		$IN_body = 1;
	}elsif($_ =~ /:e:<\/body>:/){
		$IN_body = 0;
	}else{
		;
	}
	

	if($IN_body == 1){

	if($_ =~ /:s:<sec/){
		$upper_sec = $_;
	}
	if($_ =~ /:s:</){
		($tag,$lv) = split(/\t/,$_);
		$prev_tag_lv[$lv] = $cur_tag_lv[$lv];
		$cur_tag_lv[$lv] = $tag;
	}
	if($_ =~ /:s:<xref/){
		($xref_tag,$xref_lv) = split(/\t/,$_);
		$upper_xref_lv = $xref_lv-1;
		#if($print_sec == 0){
		#	print "\t$upper_sec\n";
		#	$print_sec == 1;
		#}
		if($print_hierar == 0){
			$lv_count = 0;
			foreach(@cur_tag_lv){
				print "$_ [$lv_count]\t";
				$lv_count++;
			}
			$print_hierar = 1;
			print "\n";
		}
		print "$prev_tag_lv[$upper_xref_lv]\t$upper_xref_lv\t";
		print "$_\t";
	}
	if($_ =~ /:e:<\/xref>:/){
		print "$_\n";
		#print "$_\t";
		$print_end_xref++;
		$print_over_end_xref = 0;
		$print_anyend_tag = 0;
	}
	if($_ =~ /:e:</){
		$print_over_end_xref++;
		$print_any_end_tag++;
		($end_tag,$end_lv) = split(/\t/,$_);
		$prev_end_tag_lv[$end_lv] = $cur_end_tag_lv[$end_lv];
		$cur_end_tag[$end_lv] = $end_tag;
		#print "$print_end_xref / $print_over_end_xref / $print_anyend_tag\n";
		if($print_end_xref >= 1 && $print_over_end_xref >= 1 && $upper_xref_lv == $end_lv && $print_anyend_tag == 0){
			print ";;$_\n";
			$print_anyend_tag++;
			$print_hierar = 0;
		}
	}

	}

	if($_ =~ /^;;;/){
		print "$_\n";
	}
}
