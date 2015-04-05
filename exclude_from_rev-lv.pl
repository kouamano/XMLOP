#!/usr/bin/perl

$pr = 0;
while(<>){
	if($_ =~ /^\.\//){
		print $_;
		$pr = 0;
	}
	elsif($_ =~ /^ \[/){
		#print $_;
		if($_ =~ /.+table.+xref/i){
			$pr = 0;
		}elsif($_ =~ /.+fig.+xref/i){
			$pr = 0;
		}else{
			$pr = 1;
		}
		if($pr == 1){
			print $_;
		}else{
			#print "RM> $_";
		}
	}
	elsif($_ =~ /^[0-9]+/){
		if($pr == 1){
			print $_;
		}else{
			#print "RM> $_";
		}
	}
	elsif($_ =~ /^;;;/){
		print $_;
	}
}
