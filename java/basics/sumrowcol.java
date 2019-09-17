package basics;

public class sumrowcol {
	public static void main(String[] args)
	{
        int a[][] = {       
                {5, 2, 3},    
                {8, 4, 6},    
                {4, 7, 7}    
            };
        for(int i=0;i<a.length;i++)
        {
        	int sumriadok=0;
        	for(int u=0;u<a.length;u++) {
        		sumriadok=sumriadok + a[i][u];
        		
        	}System.out.println("Riadok " + i + "=" + sumriadok);
        	
        	
        }
        for(int i=0;i<a.length;i++)
        {
        	int sumstlpec=0;
        	for(int u=0;u<a.length;u++) 
        	{
        		sumstlpec=sumstlpec + a[u][i];
        	}System.out.println("Stlpec " + i + "=" + sumstlpec);
        }
        
	
	}}
