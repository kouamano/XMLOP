#!/usr/bin/perl

print "$ARGV[0]";
while(<>){
	if($_ =~ /<article-meta><article-id pub-id-type="pmid">([0-9]+)/g){
		print "\t$1";
	}
}
print "\n";
