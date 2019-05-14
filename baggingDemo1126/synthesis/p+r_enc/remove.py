print("this is the remove python file:-----")
import sys
import os
path=os.getcwd()
for line in sys.stdin:
	os.remove(path+r"/"+line[:-1])
print("all the file is delete-------------")

