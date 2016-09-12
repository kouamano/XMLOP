#!/usr/bin/perl
#extract_RES-Phrase-ORG-spl.pl
while(<>){
	chomp;
	$line = $_;
	($fname,$target) = split("\t",$line);
	@sp = split("<;/>",$target);
	print "$fname ;\n";
	foreach (@sp) {
		if ($_ =~ /<\/[0-9]*W>.*<ORG>/) {
			print "\t$_ ;;\n";
			@arr = split(/<ORG>/);
			foreach (@arr) {
				$_ =~ /(.*?)(<[0-9]*W>.*?<\/[0-9]*W>.*?)/;
				print "\t$1";
			}
			print ";;\n";
		}
	}
	print ";;;\n";
}
