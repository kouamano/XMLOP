#!/usr/bin/perl
#extract_RES-Phrase-ORG-spl.pl
while(<>){
	chomp;
	$line = $_;
	($fname,$target) = split("\t",$line);
	@sp = split("<;/>",$target);
	print "$fname\n";
	foreach (@sp) {
		if ($_ =~ /<\/[0-9]*W>.*<ORG>/) {
			print "\t$_ ;\n";
			@arr = split(/<ORG>/);
			$len = @arr;
			#print "\tlen: $len\n";
			foreach (@arr) {
				print "\t\t$_";
				if ($_ =~ /(.+?)(<[0-9]*W>.*?<\/[0-9]*W>.*?)/){
					$out = $1;
				}else{
					$out = "";
				}
				print "\t<PhC>$out</PhC>";
				print " ;;\n";
			}
		}
	}
	print ";;;\n";
}
