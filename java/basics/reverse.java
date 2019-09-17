package basics;

public class reverse {
	public static void main(String[] args)
	{
		int[] elementy = {1,2,3,4,5};
		for(int i=0;i<elementy.length;i++) {
			System.out.print(elementy[i]);
		}
		System.out.println(" PO: ");
		for(int i=elementy.length-1;i>-1;i--) {
			System.out.print(elementy[i]);
		}
		
		int max = elementy[0];
		for(int i=0;i<elementy.length;i++)
		{
			if(elementy[i]>max)
			{
				max=elementy[i];
			}
		}
		int temp;
		//najskor je vybrany nulty element a je porovnavany s celym listom
		//ak najde mensie cislo, vymeni sa snim a poracuje... vysledkom je najmensie cislo v nultom elemente
		//dalsi cyklus,teda, i=1
		//list prechadza od prveho, nie nulteho elementu
		//vysledkom sú zoradene cisla od najmensieho po najvacsie
		for(int i=0;i<elementy.length;i++) {
			for(int m=i+1;m<elementy.length;m++) {
				if(elementy[i]>elementy[m]) {
					temp=elementy[i];
					elementy[i]=elementy[m];
					elementy[m]=temp;
				}
			}

		}

}}
