package basics; 
public class equal_matrix {
	public static void main(String[] args)
	{
		boolean rovnasa=true;

        int a[][] = {       
                {5, 2, 3},    
                {8, 4, 6},    
                {4, 7, 7}    
            };    

        int b[][] = {       
                {5, 2, 3},    
                {8, 4, 6},    
                {4, 7, 7}    
        	};   
		for(int i=0;i<3;i++){    
			for(int j=0;j<3;j++){
				if(a[i][j]!=b[i][j]) {
					rovnasa=false;
					break;
				}
				}}
		if(rovnasa) System.out.print("Matica sa rovna");
		else 
			System.out.print("Matica sa NErovna");

}
	}