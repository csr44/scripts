package basics;
import javax.swing.*;  
//import java.awt.*;  
//import java.text.*;  
import java.util.*;  

public class digitalky implements Runnable {
	int minuty=0,sekundy=0,hodiny=0;
	Thread vlakno;
	JButton bu;
	
	public digitalky(){
		JFrame frm = new JFrame();
		bu = new JButton();
		frm.setSize(300, 400);
		bu.setBounds(100, 100, 100, 50);
		frm.add(bu);
		frm.setLayout(null);
		frm.setVisible(true);
		
		vlakno = new Thread(this);
		vlakno.start();
	}
	
	public void run() {
		try {
			while(true)
			{
				Calendar kalendar = Calendar.getInstance();
				hodiny = kalendar.get(Calendar.HOUR_OF_DAY);
				if(hodiny>12) hodiny -= 12;
				minuty = kalendar.get(Calendar.MINUTE);
				sekundy = kalendar.get(Calendar.SECOND);
				String cas0 = String.valueOf(hodiny);
				String cas1 = String.valueOf(minuty);
				String cas2 = String.valueOf(sekundy);
				bu.setText(cas0 + ":" + cas1 + ":" + cas2);
	            //Date date = kalendar.getTime();  
				Thread.sleep(1000);
				
			}
		}catch(Exception e) {}

	}
	

	
	
	public static void main(String[] args) {
		new digitalky();
	}
}

