def bcd(x):
	ans = 0	
	y1 = x/100
	y2 = (x/10)%10
	y3 = x%10
	b = bin(int(y1))
	lenf = len(b)-2
	lenf = 4-lenf
	print('0'*lenf,end="")
	print(b[2:],end="")	
	b = bin(int(y2))
	lenf = len(b)-2
	lenf = 4-lenf
	print('0'*lenf,end="")
	print(b[2:],end="")	
	b = bin(int(y3))
	lenf = len(b)-2
	lenf = 4-lenf
	print('0'*lenf,end="")
	print(b[2:],end="")	
for i in range(199):
	b = bin(i)
	lenf = 10-len(b)
	# print("Len is : ",lenf)
	print('elsif (A = "',sep="",end="")
	print('0'*lenf,sep="",end="")
	print(b[2:],'") then',sep="")
	print("    B <= ",end="")
	print('"',end="")
	bcd(i)
	print('" ;')