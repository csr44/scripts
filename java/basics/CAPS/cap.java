package CAPS;
import java.awt.BasicStroke;
import java.awt.EventQueue;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class cap extends JPanel {
	private void doDrawing(Graphics g)
	{
		Graphics2D g2d = (Graphics2D) g.create();
		//RENDERING HITS
		RenderingHints r = new RenderingHints(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		//r.put(RenderingHints.KEY_RENDERING,RenderingHints.VALUE_RENDER_QUALITY);
		g2d.setRenderingHints(r);
		
		
		
		BasicStroke bs1 = new BasicStroke(8, BasicStroke.CAP_BUTT,
                BasicStroke.JOIN_BEVEL);
        g2d.setStroke(bs1);
        g2d.drawRect(20, 30, 250, 30);
        
		BasicStroke bs2 = new BasicStroke(8, BasicStroke.CAP_ROUND,
                BasicStroke.JOIN_MITER);
        g2d.setStroke(bs2);
        g2d.drawRect(20, 80, 350, 10);
        
        BasicStroke bs4 = new BasicStroke(1, BasicStroke.CAP_SQUARE,BasicStroke.JOIN_ROUND);
        g2d.setStroke(bs4);
        g2d.drawRect(20, 200, 250, 50);
        
	}
	
	public void paintComponent(Graphics g)
	{
		super.paintComponent(g);
		doDrawing(g);
	}
	

}
