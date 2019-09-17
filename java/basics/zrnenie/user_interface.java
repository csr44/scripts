package bodky2_skuska;
import javax.swing.JFrame;

public class user_interface extends JFrame {
	
	public user_interface()
	{
		initUI();
	}
	
	public void initUI() {
		final bodky ss = new bodky();
		add(ss);
		setSize(400,300);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	
	public static void main(String[] args)
	{
		user_interface ex = new user_interface();
		ex.setVisible(true);
	}

}
