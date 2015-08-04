#!/usr/bin/perl

# vars
$help = 0;
$check = 0;
$status = 0;
$src = "";
$clm = "";
$trm = "";
$ie = 0;

# subroutine
sub _help {
	print "USAGE:\n";
	print " extract_hit_sentence_from_colored.pl src=<src file> clm=<column No> terms=<term list comma sep>.\n";
	print " <column>: targets are columns after n-th.\n";
}

sub _check {
	print "ARGS:\n";
	print " help:$help:\n";
	print " check:$check:\n";
	print " status:$status:\n";
	print " src:$src:\n";
	print " clm:$clm:\n";
	print " terms:$trm:\n";
}

sub _status {
	print "STATUS:\n";
	printf " under construction.\n"
}

# argment analysis
foreach $l (@ARGV) {
	if($l eq "-h"){
		$help = 1;
	}elsif($l eq "-c"){
		$check = 1;
	}elsif($l eq "-s"){
		$status = 1;
	}elsif($l =~ /src=(.*)/){
		$src = $1;
	}elsif($l =~ /clm=(.*)/){
		$clm = $1;
	}elsif($l =~ /terms=(.*)/){
		$trm = $1;
	}else{
		print "unknown:$l:\n";
	}
}

# main
if($help == 1){
	&_help;
	$ie = 1;
}
if($check == 1){
	&_check;
	$ie = 1;
}
if($status == 1){
	&_status;
	$ie = 1;
}
if($ie == 1){
	exit(0);
}

##terms
@terms = split(",",$trm);
$numcols = @terms;
@colors = ();
$lcount = 0;
$llcount = 0;
#@cterms = ();
%cterms = ();

print "<html>\n";
print "<head></head>\n";
print "<body>\n";
open(IN,$src);
$lcount = 0;
while(<IN>){
	chomp;
	@linearr = split(/\t/,$_);
	$numclm = @linearr;
	#$target = $linearr[$clm];
	###行シークエンス番号の出力
	print "[$lcount]\t";
	$lcount++;
	###非対象カラムの出力・shift
	for($i=0;$i<$clm;$i++){
		$out = shift(@linearr);
		print "$out\t";
	}
	###target作成
	$target = join("<;/> ",@linearr);
	print "<br></br>";
	print "<;;/>";
	###処理
	####センテンス後端に<;/> を挿入
	$target =~ s/<\/sec><sec/<\/sec><;\/> <sec/g;
	$target =~ s/<\/p><p>/<\/p><;\/> <p>/g;
	$target =~ s/([a-z0-9\/\<][a-zA-Z0-9\/\<][a-zA-Z0-9\/][a-zA-Z0-9\>]\.\s)/$1<;\/> /g;
	$target =~ s/([a-z0-9\/\<][a-zA-Z0-9\/\<][a-zA-Z0-9\/][a-zA-Z0-9\>][\)\]]\.\s)/$1<;\/> /g;
	$target =~ s/([A-Z][0-9A-Z][0-9A-Z][0-9A-Z]\.\s)/$1<;\/> /g;
	$target =~ s/([A-Z][0-9A-Z][0-9A-Z][0-9A-Z][\)\]]\.\s)/$1<;\/> /g;
	####センテンスを区切りで分断、配列へ
	@target = split("<;/> ",$target);
	#print @target;
	###1行中の複数のセンテンス
	$llcount = 0;
	@colors = ();
	$sum = 0;
	foreach(@target){
		#print ";;$_;;";
		@colors = ();
		$sum = 0;
		#@cterms = ();
		%cterms = ();
		####1センテンスごとの処理
		for($i=0;$i<$numcols;$i++){
			#if($_ =~ /(<font color="$terms[$i]">[^<>]+?<\/font>)/g){
			#	$colors[$i] = 1;
			#	push(@cterms,$1);
			#}else{
			#	$colors[$i] = 0;
			#}
			#while($_ =~ /(<font color="$terms[$i]">[^<>]+?<\/font>)/g){
			while($_ =~ /<font color="($terms[$i])">([^<>]+?)<\/font>/g){
				$colors[$i] = 1;
				#push(@cterms,$1);
				$cterms{$1} = $cterms{$1}." ; "."<font color=\"$terms[$i]\">".$2."</font>";
			}
		}
		#print " -- @colors -- ";
		####$colorsを数値配列として処理できない
		foreach(@colors){
			if($_ == 1){
				$sum++;
			}
		}
		#print "++ $sum | $numcols ++";
		if($sum == $numcols){
			print "[[$llcount]] ";
			print "{";
			#foreach(@cterms){
			#	print "$_ ; ";
			#}
			while(my ($key,$val) = each(%cterms)){
				print "{$key ; $val} ";
			}
			print "}";
			print " $_ <;/> <br></br>";
		}
		$llcount++;
	}
	print "<;;/>";
	print "<hr></hr>";
	print "\n";
}
close(IN);
print "</body>\n";
print "</html>\n";


