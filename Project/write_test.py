import random
N = 30
# total 150 B

for j in range(5):
	print("wait for clk_period;")
	print('iData <= "',end="")
	for i in range(16):
		print('1',random.randint(0,1),random.randint(0,1),random.randint(0,1),random.randint(0,1),random.randint(0,1),random.randint(0,1),random.randint(0,1),random.randint(0,1),sep="",end="")
	print('";')

print("-- Table Number 1 and table address 0000010100001101")

print("wait for clk_period;")
print('opcode <= "001";')
print('iData <= "',end="")

# print(sts[::-1],end="")
for i in range(4):
	print('1',random.randint(0,1),random.randint(0,1),random.randint(0,1),random.randint(0,1),random.randint(0,1),random.randint(0,1),random.randint(0,1),random.randint(0,1),sep="",end="")

sts = "100000001" + "100001101" + "100000101" + "100001101"
print(sts,end="")
print("100000001","11100111","00000001","00000001","00000001","00000001","00000001","00000001",sep="1",end="")
print('";')

for l in range(3):
	print("wait for clk_period;")
	print('iData <= "',end="")
	for i in range(16):
		print('1',random.randint(0,1),random.randint(0,1),random.randint(0,1),random.randint(0,1),random.randint(0,1),random.randint(0,1),random.randint(0,1),random.randint(0,1),sep="",end="")
	print('";')

print("wait for clk_period*5;")
print("Wr_complete <= '1';")
print('iData <= "',end="")

for m in range(144):
	print('0',end="")
print('";')

print("wait for clk_period*4;")
print("Ack_sent <= '1';")
print('iData <= "',end="")

for m in range(144):
	print('0',end="")
print('";')

print("wait for clk_period;")
print('iData <= "',end="")

for m in range(144):
	print('0',end="")
print('";')
# print(len("110010111101110011110011001110100011101100001000100001001011001101011111000110011101110011100000111010110001100101001010001011100010011110011011"))

