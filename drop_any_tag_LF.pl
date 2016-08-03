#!/usr/bin/perl

while(<>){
	chomp;
	push(@arr,$_);
}
$line = join(" ",@arr);
$line =~ s/<[^<>]*>/ /ig;
$line =~ s/<\![^<>]*>/ /ig;
$line =~ s/<\?[^<>]*>/ /ig;
$line =~ s/^\s+//;
$line =~ s/\s+$//;
$line =~ s/\s+/ /g;
print "$line\n";
