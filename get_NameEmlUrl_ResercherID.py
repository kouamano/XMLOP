#!/usr/bin/python

import sys
#from xml.etree.ElementTree import *
from xml.etree import ElementTree

argvs = sys.argv

tree = ElementTree.parse(argvs[1])
root = tree.getroot()
#print root[1][1][0].text
plist = root[1]
#print plist[1][0].text
plen = len(plist)
itrs = range(1,plen)
for i in itrs:
  print plist[i][0].text, plist[i][1].text, "\t", plist[i][2].text, "\t",
  for url in plist[i][4]:
    print url.text, ";",
  print
