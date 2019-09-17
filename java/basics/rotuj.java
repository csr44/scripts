package basics;

public class rotuj {
	public static void main(String[] args)
	{
		int[] elementy = {1,2,3,4,5};
		for(int i=0;i<elementy.length;i++) {
			System.out.print(elementy[i]);
		}
		int prvy = elementy[0];
		for(int i=1;i<elementy.length;i++) {
			elementy[i-1] = elementy[i];
		}
		elementy[elementy.length -1]=prvy;
		System.out.println("   Po :");
		for(int i=0;i<elementy.length;i++) {
			System.out.print(elementy[i]);
		}


	}}


