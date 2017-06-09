#!/home/kamano/anaconda3/bin/python
# -*- coding: utf-8 -*-
import sys
import os
import re
import xml.etree.ElementTree as ET

args = sys.argv
tree = ET.parse(args[1])
root = tree.getroot()
for e in root.findall(".//sec"):
  #e.attrib
  #tostring(e.attrib)
  #print(e.attrib)
  #print(type(e.attrib)," ; ",e.attrib)
  #print(e.attrib.items())
  #print(e.attrib['sec-type'])
  #print(type(e.attrib['sec-type'])," ; ",e.attrib['sec-type'])
  #if re.match(r".*",e.attrib['sec-type']):
  if re.match(r"materials",e.attrib['sec-type'],re.IGNORECASE):
    print(e.text)

