#!/usr/bin/perl
#extract_+RES+-Phrase-ORG-spl.pl
#insert <RESc> tag(s) into a sentence.

$file = $ARGV[0];
$ncol = $ARGV[1];

if($ncol eq ""){
	$ncol = 3;
}

open(IN,$file);
while(<IN>){
	chomp;
	$line = $_;
	if($ncol == 3){
		($num,$fname,$target) = split("\t",$line);
	}elsif($ncol == 2){
		($fname,$target) = split("\t",$line);
	}
	@sp = split("<;/>",$target);
	print "$fname\n";
	foreach (@sp) {
		if ($_ =~ /<\/[0-9]*W>.*<\/ORG>/) {
			#print "\t$_ ;\n";
			$l = $_;
			$l =~ s/(.+?)(<[0-9]*W>.+?<\/[0-9]*W>.*?<ORG>.+?<\/ORG>)/<RESc>$1<\/RESc>$2/g;
			print "\t$l ;\n";
			#@arr = split(/<\/ORG>/);
			#$count = 0;
			#foreach (@arr) {
			#	$count++;
			#	#print "\t\t$_\n";
			#	$_ =~ s/(.+?)(<[0-9]*W>.*?<\/[0-9]*W>)/<RESc>$1<\/RESc>$2/g;
			#	print "\t\t[$count]$_ ;;\n";
			#}
		}
	}
	print ";;;\n";
}
close(IN);
