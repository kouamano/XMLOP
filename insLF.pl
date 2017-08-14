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
	}elsif($_ =~ /^b\"/){
		$_ =~ s/^b\"//;
		$_ =~ s/\"$//;
		@arr = split(/<;\/>/,$_);
		foreach(@arr){
			chomp;
			print "\t$_\n";
		}
	}else{
		print "$_\n";
	}
}
