package basics;

public class binary_search {
	public static void main(String[] args)
	{
        int arr[] ={57,71,6,3,8,44,550};  
        int cislo = 71;
        System.out.println("List pred");  
        for(int i=0; i < arr.length; i++){  
                System.out.print(arr[i] + " ");  
        }
        for(int i=0;i<arr.length;i++)
        {
            if(cislo == arr[i])
            {
            	System.out.print(i);
            }
        }

        
	
	
	}

}
