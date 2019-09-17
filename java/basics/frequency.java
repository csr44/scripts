package basics;

public class frequency {
	public static void main(String[] args)
	{
		int[] elementy = {1,5,1,2,1,3,4,4,4,4,4,8};
		int poc = 0;
		int frekvencia = 0;
		int[] zobraz = new int[elementy.length];
		for(int i=0;i<elementy.length;i++) {
			for(int j=0;j<elementy.length;j++) {
				if(elementy[i] == elementy[j]) {
					poc++;
				}

				
			}
			zobraz[i] = elementy[i];
			frekvencia = frekvencia + poc;
			poc=0;

		}
	}

}
