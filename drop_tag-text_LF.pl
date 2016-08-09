#!/usr/bin/perl

while(<>){
	chomp;
	push(@arr,$_);
}
$line = join(" ",@arr);
$line =~ s/<([^<>]*)>/<>/ig;
print "$line\n";
