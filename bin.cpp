#include<iostream>
using namespace std;
int binarySearch(int a[20],int key,int low,int upper);
int Recursive(int a[20],int key,int lower,int upper);
int Nonrecursive(int a[20],int key,int lower,int upper);
int main()
{
	 int a[20],i,n=10,key,upper=n,lower=0,pos,ch,choice;
	
	do{
	cout<<"\n=============BINARY SEARCH===================";
	cout<<"\n1.USING SORTED ARRAY";
	cout<<"\n2.USING UNSORTED ARRAY";
	cout<<"\nENTER YOUR CHOICE :";
	cin>>choice;
	switch(choice)
	{	
	 case 1:cout<<"Enter total number of Elements Count to Search: "<<endl;
		cin>>n;
		cout<<"Enter the ("<<n<< ") Elements in ascending order: "<<endl;
		for(i=0;i<n;i++)
	 	 {
	    		cin>>a[i];
	  	 }
		cout<<"==========TO BE SEARCHED USING==========="<<endl;
		cout<<"1.RECURSIVE FUNCTION"<<endl;
		cout<<"2.NON RECURSIVE FUNCTION"<<endl;
		cout<<"3.EXIT"<<endl;
		cout<<"Enter your choice :"<<endl;
		cin>>ch;
		switch(ch)
		{
			case 1:cout<<"Enter the Element which you want to search: "<<endl;
			       cin>>key;
	                       pos= Recursive(a,key,lower,upper);
			       if(pos==-1)
	  			cout<<"\n\t The Key Element ("<< key << " ) is not found in given list ..."<<endl;
			       else
	  			cout<<"The Key element (" <<key<< " ) is found and present at " <<pos+1 << " th location...\n";
        		       break;
		
			case 2:cout<<"Enter the Element which you want to search: "<<endl;
			       cin>>key;
			       pos= Nonrecursive(a,key,lower,upper);
			       if(pos==-1)
	  			cout<<"\n\t The Key Element ("<< key << " ) is not found in given list ..."<<endl;
			       else
	  			cout<<"The Key element (" <<key<< " ) is found and present at " <<pos+1 << " th location...\n";
       			       break;

			case 3: return 0;
		}
	break;
	case 2:	cout<<"Enter total number of Elements Count to Search: "<<endl;
		cin>>n;
		cout<<"Enter the ("<<n<< ") Elements :"<<endl;
		for(i=1;i<=n;i++)
	 	 {
	    		cin>>a[i];
	  	 }
		int temp=0;
    		for(int row=1;row<=n-1;row++)
			for(int col=1;col<=n-1;col++)
				if(a[col]>a[col+1])
				{
					temp=a[col];                      // Interchange Values
					a[col]=a[col+1];
					a[col+1]=temp;
				}
		for(i=1;i<=n;i++)
	 	 {
	    		cout<<"\t"<<a[i]<<endl;
	  	 }
		cout<<"==========TO BE SEARCHED USING==========="<<endl;
		cout<<"1.RECURSIVE FUNCTION"<<endl;
		cout<<"2.NON RECURSIVE FUNCTION"<<endl;
		cout<<"3.EXIT"<<endl;
		cout<<"Enter your choice :"<<endl;
		cin>>ch;
		switch(ch)
		{
			case 1:cout<<"Enter the Element which you want to search: "<<endl;
			       cin>>key;
	                       pos= Recursive(a,key,lower,upper);
			       if(pos==-1)
	  			cout<<"\n\t The Key Element ("<< key << " ) is not found in given list ..."<<endl;
			       else
	  			cout<<"The Key element (" <<key<< " ) is found and present at " <<pos<< " th location...\n";
        		       break;
		
			case 2:cout<<"Enter the Element which you want to search: "<<endl;
			       cin>>key;
			       pos= Nonrecursive(a,key,lower,upper);
			       if(pos==-1)
	  			cout<<"\n\t The Key Element ("<< key << " ) is not found in given list ..."<<endl;
			       else
	  			cout<<"The Key element (" <<key<< " ) is found and present at " <<pos<< " th location...\n";
       			       break;

			case 3: return 0;
		}

	break;
	}
	}while(ch!=3);
	return 0;
}
int Recursive(int a[20],int key,int lower,int upper)
{
  if(lower<=upper)
    {
      int mid=(lower+upper)/2;
      if(key == a[mid])
      return mid;
      else
      if (key< a[mid])
         
             return(Recursive(a,key,lower,mid-1));
             else
            return(Recursive(a,key,mid+1,upper));
     }
         
    return -1;
   
}

int Nonrecursive(int a[20],int key,int lower,int upper)
{
  while(lower<=upper)
    {
      int mid=(lower+upper)/2;
      if(key == a[mid])
      return mid;
      else
      if (key < a[mid])
         
             upper=mid-1;
             else
            lower=mid+1;
     }
         
    return -1;
   
}
