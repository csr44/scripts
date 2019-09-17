package CAPS;
import java.awt.BasicStroke;
import java.awt.EventQueue;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class surface extends JFrame {
	public surface()
	{
		initUI();
	}
	private void initUI()
	{
		add(new cap());
		setSize(280,150);
	}
	public static void main(String[] args)
	{
		surface mm = new surface();
		mm.setVisible(true);
	}

}
