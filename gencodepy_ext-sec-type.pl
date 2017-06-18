#!/usr/bin/perl

print << "EOF";
#!/home/kamano/anaconda3/bin/python
# -*- coding: utf-8 -*-
import sys
import os
import xml.etree.ElementTree as ET

args = sys.argv
tree = ET.parse(args[1])
root = tree.getroot()

EOF

while(<>){
  chomp;
  print 'for e in root.findall(\'.//*[@';
  print "$_";
  print ']\'):';
  print "\n";
  print "  try:\n";
  print "    print(ET.tostring(e))\n";
  print "  except:\n";
  print "    pass\n";
}
