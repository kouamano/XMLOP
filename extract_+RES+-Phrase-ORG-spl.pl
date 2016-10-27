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
			$count = 0;
			foreach (@arr) {
				$count++;
				#print "\t\t$_\n";
				$_ =~ s/(.+?)(<[0-9]*W>.*?<\/[0-9]*W>)/<RESc>$1<\/RESc>$2/g;
				print "\t\t[$count]$_ ;;\n";
				#if ($_ =~ /(.+?)(<[0-9]*W>.*?<\/[0-9]*W>)/){
				#	$out = $1;
				#}else{
				#	$out = "";
				#}
				#print "\t<RES_C>$out</RES_C>";
			}
		}
	}
	print ";;;\n";
}
