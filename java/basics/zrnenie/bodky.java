package bodky2_skuska;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Random;
import javax.swing.JPanel;
import javax.swing.Timer;
public class bodky extends JPanel implements ActionListener {
	
	private Timer time;
	
	public bodky()
	{
		inicializuj_cas();
	}
	
	public void inicializuj_cas()
	{
		time = new Timer(5, this);
		time.start();
		
	}
	
	private void doDrawing(Graphics g)
	{
		Graphics2D g2d = (Graphics2D) g;
		g2d.setPaint(Color.blue);
		
		int w = getWidth();
		int h = getHeight();
		Random r = new Random();
		
		for(int i=0;i<2000;i++)
		{
			int x = Math.abs(r.nextInt()) % w;
			int y = Math.abs(r.nextInt()) % h;
			g2d.drawLine(x, y, x, y);
		}
		
	}
	
	public void paintComponent(Graphics g)
	{
		super.paintComponent(g);
		doDrawing(g);
	}
	
	public void actionPerformed(ActionEvent e)
	{
		repaint();
	}

}
