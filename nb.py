import numpy as np
from sklearn.naive_bayes import GaussianNB
data=[]
x=[]
y=[]
raw_data=open('B6data.txt','r')
for i in raw_data:
	splitted=i.split(',')
	splitted[3]=splitted[3].replace('\n','')
	data.append(splitted)
for i in data:
	temp=[]
	for j in i[:3]:
		temp.append(int(j))
	x.append(temp)
for i in data:
	y.append(i[3])
input=np.array(x)
output=np.array(y)
c=GaussianNB()
c.fit(input,output)
print c.predict([26,2,2,"Research"])

/*
data.txt file

30,1,9,Consultancy
21,2,1,Service
26,2,2,Research
28,3,10,Service
40,2,14,Consultancy
35,1,10,Research
27,3,6,Research
32,2,9,Service
45,3,17,Consultancy
*/
36,1,7,Research
