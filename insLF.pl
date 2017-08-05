#!/usr/bin/perl

while(<>){
	chomp;
	if($_ =~ /^b\'/){
		$_ =~ s/^b\'//;
		$_ =~ s/\'$//;
		@arr = split(/<;\/>/,$_);
		foreach(@arr){
			chomp;
			print "\t$_\n";
		}
		#print "$_";
	}else{
		print "$_\n";
	}
}
