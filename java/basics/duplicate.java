package basics; 
public class duplicate {
	public static void main(String[] args)
	{
		int a[][]={{1,3,4},{2,4,3},{3,4,5}};        
		for(int i=a.length-1;i>-1;i--){    
			for(int j=a.length-1;j>-1;j--){
				System.out.print(a[i][j] + " ");
			}System.out.println();
	}

}}
