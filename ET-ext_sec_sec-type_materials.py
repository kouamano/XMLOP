#!/home/kamano/anaconda3/bin/python
# -*- coding: utf-8 -*-
import sys
import os
import xml.etree.ElementTree as ET

args = sys.argv
tree = ET.parse(args[1])
root = tree.getroot()
#print('+++++')
#for e in root.findall(".//sec"):
#  print(e.attrib)
#print('+++++')
#for e in root.findall(".//*[@sec-type='results']"):
#  print(e.tag)
#  print("+"+e.text+"+")
#print('+++++')
for e in root.findall('.//*[@sec-type="materials"]'):
  txt = e.text
  print(ET.tostring(e))
  #if txt!=None:
  #  print(e.text)
  #  print(ET.tostring(e))
  #for c in e.findall('.//*'):
  #  print(c.text)
for e in root.findall('.//*[@sec-type="materials|methods"]'):
  txt = e.text
  print(ET.tostring(e))

