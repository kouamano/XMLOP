#!/usr/bin/python
# -*- coding: utf-8 -*- 

import sys
import xml.dom.minidom
import xml.etree.ElementTree as ET

EOD=";;;"

argvs=sys.argv

def getchild(root, level):
	print ":"*level + "<" + root.tagName + " " + root.getAttribute("sec-type") + ">"
	#print ":"*level + "<" + root.tagName + " " + root.attrib + ">"
	for node in root.childNodes:
		if node.nodeType == node.ELEMENT_NODE:
			getchild(node, level + 1)




if __name__ == "__main__":
	print argvs[1]
	dom = xml.dom.minidom.parse(argvs[1])
	getchild(dom.documentElement, 0)
	print EOD
#	for url in dom.getElementsByTagName("url"):
#		print url.firstChild.data
