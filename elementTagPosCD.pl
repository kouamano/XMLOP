#!/usr/bin/perl

$fname = $ARGV[0];
if($fname =~ /^\//){
	print "$fname\n";
}elsif($fname =~ /\.\//){
	print "$fname\n";
}else{
	print "./$fname\n";
}

$lv = 0;
while(<>){
	push(@arr,$_);
}
$xml_data = join("",@arr);
#$tx = join("",@arr);
#$tx =~ s/\s/ /g;
#$tx =~ s/(<!--.*?-->)/$count=0;$sb="";while($count < length($1)){$sb = $sb." "; $count++;};$sb/eg;
@arr = ();
@tag_arr = ();
while($xml_data =~ /(<[^<>]*[^\/]{0,1}>|<!\[CDATA\[|\]\]>)/ig){
  # 出現位置取得
  $pos = pos($xml_data);
  $target = $1;
  $len = length($target);
  $s_pos = $pos-$len;
  $e_pos = $pos-1;

  # タグ種類選択
  if($target =~ /<!\[CDATA\[/){           # CDATA Start
    push(@tag_arr,"$s_pos"."-"."$e_pos".":"."ds".":$target:\n");
  }elsif($target =~ /\]\]>/){             # CDATA End
    push(@tag_arr,"$s_pos"."-"."$e_pos".":"."de".":$target:\n");
  }elsif($target =~ /^<!--/){             # コメントタグ
    push(@tag_arr,"$s_pos"."-"."$e_pos".":"."i".":$target:\n");
  }elsif($target =~ /^<!/){               # 情報タグ
    push(@tag_arr,"$s_pos"."-"."$e_pos".":"."i".":$target:\n");
  }elsif($target =~ /^<\?/){              # 情報タグ
    push(@tag_arr,"$s_pos"."-"."$e_pos".":"."i".":$target:\n");
  }elsif($target =~ /^<>$/){              # ???
    push(@tag_arr,"$s_pos"."-"."$e_pos".":"."n".":$target:\n");
  }elsif($target =~ /^<\/>$/){            # 空要素タグ
    push(@tag_arr,"$s_pos"."-"."$e_pos".":"."n".":$target:\n");
  }elsif($target =~ /^<\//){              # 一般要素 終了タグ
    push(@tag_arr,"$s_pos"."-"."$e_pos".":"."e".":$target:\t$lv\n");
    $lv--;
  }elsif($target =~ /^<[^<>]+\/>$/){      # 空要素タグ
    push(@tag_arr,"$s_pos"."-"."$e_pos".":"."n".":$target:\n");
  }elsif($target =~ /^<[^<>\/][^<>]*>$/){ # 一般要素 開始タグ
    $lv++;
    push(@tag_arr,"$s_pos"."-"."$e_pos".":"."s".":$target:\t$lv\n");
  }else{                                  # その他
    push(@tag_arr,"$s_pos"."-"."$e_pos".":"."o".":$target:\n");
  }
}

print @tag_arr;
print ";;;\n";
