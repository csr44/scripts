package basics;

public class bubble {
	static void sort(int[] list)
	{
		int dlzka = list.length;
		for(int o=0;o<dlzka;o++) {
			for(int m=1;m<dlzka-o;m++) {

				if(list[m-1]>list[m])
				{
					int temp = list[m-1];
					list[m-1] = list[m];
					list[m] = temp;
					
				}
			}
		}
			
	}
	
	public static void main(String[] args)
	{
        int arr[] ={32,65,5,2,12,320,55};  
        
        System.out.println("List pred");  
        for(int i=0; i < arr.length; i++){  
                System.out.print(arr[i] + " ");  
        }  
        System.out.println("List po");
        sort(arr);
        for(int i=0; i < arr.length; i++){  
            System.out.print(arr[i] + " ");  
    }  
	}

}
