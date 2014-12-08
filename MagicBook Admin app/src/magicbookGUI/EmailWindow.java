package magicbookGUI;

import java.awt.Dimension;
import java.awt.EventQueue;

import javax.swing.Box;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

import java.awt.BorderLayout;

import javax.swing.border.TitledBorder;
import javax.swing.border.MatteBorder;

import java.awt.Color;
import java.util.ArrayList;

import javax.swing.BoxLayout;
import javax.swing.JTextField;
import javax.swing.JLabel;

import java.awt.Component;
import java.awt.FlowLayout;

import javax.swing.JTextArea;
import javax.swing.SwingConstants;
import javax.swing.JButton;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.SystemColor;

public class EmailWindow {

	ArrayList<String> recipients;
	
	public void open(){
		frame.setVisible(true);
	}
	private JFrame frame;
	private JTextField textTitle;
	private JTextField textRecipients;
	private JTextArea textMail;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					EmailWindow window = new EmailWindow();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public EmailWindow() {
		initialize();
	}
	public EmailWindow(ArrayList<String> recipients){
		this.recipients = recipients;
		initialize();
		
		String rec = "";
		for(int i=0; i<recipients.size(); i++)
		{
			rec += recipients.get(i);
			if(i!=recipients.size()-1)
				rec += ",";
		}
		
		System.out.println(rec);
		textRecipients.setText(rec);
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 602, 359);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(new BoxLayout(frame.getContentPane(), BoxLayout.X_AXIS));
		
		JPanel panel = new JPanel();
		panel.setBorder(new TitledBorder(new MatteBorder(4, 4, 4, 4, (Color) new Color(51, 153, 255)), "Send emails", TitledBorder.LEADING, TitledBorder.TOP, null, new Color(255, 0, 0)));
		
		frame.getContentPane().add(Box.createRigidArea(new Dimension(5,0)));
		frame.getContentPane().add(panel);
		panel.setLayout(new BoxLayout(panel, BoxLayout.X_AXIS));
		
		JPanel panel_1 = new JPanel();
		panel_1.setAlignmentX(Component.RIGHT_ALIGNMENT);
		panel.add(panel_1);
		panel_1.setLayout(new BorderLayout(0, 0));
		
		JPanel panel_2 = new JPanel();
		panel_1.add(panel_2, BorderLayout.NORTH);
		panel_2.setLayout(new BoxLayout(panel_2, BoxLayout.PAGE_AXIS));
		
		JLabel lblNewLabel = new JLabel("Title:");
		panel_2.add(lblNewLabel);
		
		JTextField textTitle = new JTextField();
		panel_2.add(textTitle);
		textTitle.setColumns(10);
		
		JLabel lblNewLabel_1 = new JLabel("To:");
		panel_2.add(lblNewLabel_1);
		
		textRecipients = new JTextField();
		textRecipients.setEditable(false);
		panel_2.add(textRecipients);
		textRecipients.setColumns(10);
		frame.getContentPane().add(Box.createRigidArea(new Dimension(5,0)));
		
		JPanel panel_3 = new JPanel();
		panel_1.add(panel_3, BorderLayout.CENTER);
		panel_3.setLayout(new BorderLayout(0, 0));
		
		JLabel lblNewLabel_2 = new JLabel("Content:");
		lblNewLabel_2.setHorizontalAlignment(SwingConstants.CENTER);
		panel_3.add(lblNewLabel_2, BorderLayout.NORTH);
		
		JPanel panel_4 = new JPanel();
		panel_3.add(panel_4, BorderLayout.SOUTH);
		panel_4.setLayout(new BorderLayout(0, 0));
		
		JPanel panel_5 = new JPanel();
		panel_4.add(panel_5, BorderLayout.EAST);
		
		JButton btnSend = new JButton("Send");
		btnSend.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String title = textTitle.getText();
				String rec = textRecipients.getText();
				String mail = textMail.getText();
				if(title != null && !title.isEmpty() && rec != null && !rec.isEmpty() && mail != null && !mail.isEmpty())
				{
					EmailSender es 	= new EmailSender(title, rec, mail);
					es.sendEmail();

					JOptionPane.showMessageDialog(frame, "Emails sent successfully");
					frame.dispose();
				}
				else 
				{
					JOptionPane.showMessageDialog(frame, "Please fill in the requested fields");
				}
			}
		});
		panel_5.add(btnSend);
		btnSend.setHorizontalAlignment(SwingConstants.RIGHT);
		
		JButton btnCancel = new JButton("Cancel");
		btnCancel.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				frame.dispose();
			}
		});
		panel_5.add(btnCancel);
		
		Component rigidArea = Box.createRigidArea(new Dimension(10, 20));
		panel_3.add(rigidArea, BorderLayout.WEST);
		
		Component rigidArea_1 = Box.createRigidArea(new Dimension(10, 20));
		panel_3.add(rigidArea_1, BorderLayout.EAST);
		
		JPanel panel_6 = new JPanel();
		panel_6.setBorder(new MatteBorder(2, 2, 2, 2, (Color) SystemColor.textHighlight));
		panel_3.add(panel_6, BorderLayout.CENTER);
		panel_6.setLayout(new BorderLayout(0, 0));
		
		textMail = new JTextArea();
		panel_6.add(textMail);
	}

}
