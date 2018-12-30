#!/usr/bin/env python2
from subprocess import check_output
import os
def get_pass(account):
#    return check_output("lpass show --password "+account, shell=True).strip("\n")
# passw = check_output("/home/max/git/PAPM/cli -socket \"/home/max/git/PAPM/socket\" -command \"get;email\"", shell=True).strip("\n")
 # print("Password: "+passw)
   
         
         
 return check_output(['/home/max/git/YouShallNotPassword/cli', '-socket', '/home/max/git/YouShallNotPassword/socket', '-command', 'get;'+account]).decode('utf-8')
