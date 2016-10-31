#!/usr/bin/perl
#extract_ORG-Phrase-+RES+-spl.pl
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
		if ($_ =~ /<ORG>.*<\/[0-9]*W>/) {
			#print "\t$_ ;\n";
			$l = $_;
			#$l =~ s/(<ORG>.+?<\/ORG>.*?<[0-9]*W>.+<\/[0-9]*W>)(.+)/$1<RESc>$2<\/RESc>/g;
			#$l =~ s/(<ORG>.+?<\/ORG>.*?<[0-9]*W>.+<\/[0-9]*W>)(.+)(?!<ORG>)*/$1<RESc>$2<\/RESc>$3/g;
			$l =~ s/(<ORG>.+?<\/ORG>.*?<[0-9]*W>.+?<\/[0-9]*W>)(((?!<ORG>).)+)/$1<RESc>$2<\/RESc>/g;
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
