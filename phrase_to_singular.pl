#!/usr/bin/perl
while(<>){
	@arr = ();
	chomp;
	$_ =~ s/^\s+//;
	$_ =~ s/\s+$//;
	@arr = split(/\s+/,$_);
	foreach(@arr){
		#print ";;$_;;";
		$term = $_;
		$len = length($term);
		$st3 = substr($term,$len-3,3);
		$st3 = lc($st3);
		$st2 = substr($term,$len-2,2);
		$st2 = lc($st2);
		$st1 = substr($term,$len-1,1);
		$last = $st1;
		$st1 = lc($st1);
		if($st3 eq "ies"){
			substr($term,$len-3,3,"y");
			print "$term ";
		}elsif($st2 eq "ss"){
			print "$_ ";
		}elsif($st2 eq "us"){
			print "$_ ";
		}elsif($st2 eq "'s"){
			print "$_ ";
		}elsif($st1 eq "s" && $len <= 4){
			print "$_ ";
		}elsif($st1 eq "s" && $len > 4){
			substr($term,$len-1,1,"");
			print "$term ";
		}elsif($last eq "s"){
			$tmp = $term;
			$tmp2 = $_;
			substr($tmp,$len-1,1,"");
			substr($tmp2,$len-1,1,"");
			$tmp = uc($tmp);
			if($tmp eq $tmp2 && $len > 3){
				print "$tmp2 ";
				next;
			}
		}else{
			print "$_ ";
		}
		#print "\n"
	}
	print "\n"
}
