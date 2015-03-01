#!/usr/bin/python

import time
import os

while True:
	try:
		f = open("/sys/class/net/wlan0/operstate", "r")
		a = f.read()
		print a
		if not a.startswith("up"):
			print "It is down"
			os.system("ifup wlan0")
			time.sleep(60)
		f.close()
	except:
		pass
	time.sleep(5)
