package basics;

public class fibonacci {
	
	public static void main(String[] args) {
		int pocet=20, num1=0, num2=1, sum=0;
		System.out.print(num1 + " " + num2 + " ");
		for(int i=0;i<pocet;i++) {
			sum=num1+num2;
			num1=num2;
			num2=sum;
			System.out.print(sum + " ");
		}
	}

}
