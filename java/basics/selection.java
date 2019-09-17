package basics;

public class selection {
    public static void sel(int ar[])
    {
    	int dlzka = ar.length;
    	int temp = 0;
    	
    	for(int j=0;j<dlzka;j++) {
    		int index = j;
        	for(int i=j + 1;i<dlzka;i++) {
        		if(ar[i]<ar[index])
        		{
        			index=i;
        		}
        	}
        	temp=ar[index];
        	ar[index]=ar[j];
        	ar[j]=temp;
    		
    	}
    	
    }
	public static void main(String[] args)
	{
        int arr[] ={57,71,88,24,8,44,550};  
        
        System.out.println("List pred");  
        for(int i=0; i < arr.length; i++){  
                System.out.print(arr[i] + " ");  
        }  
        System.out.println("List po");
        sel(arr);
        for(int i=0; i < arr.length; i++){  
            System.out.print(arr[i] + " ");  
    }

    }

}
