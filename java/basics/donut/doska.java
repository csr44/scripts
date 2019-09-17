package donut;

import java.awt.EventQueue;

import javax.swing.JFrame;

public class doska extends JFrame {

    public doska() {

        initUI();
    }

    private void initUI() {

        add(new surface());

        setTitle("Simple Java 2D example");
        setSize(300, 200);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    public static void main(String[] args) {

        EventQueue.invokeLater(new Runnable() {

            @Override
            public void run() {
                doska ex = new doska();
                ex.setVisible(true);
            }
        });
    }
}