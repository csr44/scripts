package tah;
import java.awt.BasicStroke;
import java.awt.EventQueue;
import java.awt.Graphics;
import java.awt.Graphics2D;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class tahx extends JFrame {
	
	public tahx() {
		initUI();
	}
	private void initUI()
	{
		tah_xx ss = new tah_xx();
		add(ss);
		setSize(600,400);
		
	}
	
	public static void main(String[] args)
	{
		tahx m = new tahx();
		m.setVisible(true);
	}

}
