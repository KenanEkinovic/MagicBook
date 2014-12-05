package magicbookGUI;

//oracle apex

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JPasswordField;

public class Login {

	private JFrame frmMagicbookAdministratorApp;
	private JTextField txtUsername;
	static private DBConnect connect;
	private JPasswordField txtPassword;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		
		connect = new DBConnect();
		
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Login window = new Login();
					window.frmMagicbookAdministratorApp.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public Login() {
		initialize();
	}

	
	
	private void initialize() {
		frmMagicbookAdministratorApp = new JFrame();
		frmMagicbookAdministratorApp.setResizable(false);
		frmMagicbookAdministratorApp.setTitle("MagicBook Administrator app");
		frmMagicbookAdministratorApp.setBounds(100, 100, 369, 142);
		frmMagicbookAdministratorApp.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frmMagicbookAdministratorApp.getContentPane().setLayout(null);
		
		JLabel lblUsername = new JLabel("Username:");
		lblUsername.setBounds(10, 14, 99, 14);
		frmMagicbookAdministratorApp.getContentPane().add(lblUsername);
		
		JLabel lblPassword = new JLabel("Password:");
		lblPassword.setBounds(10, 45, 99, 14);
		frmMagicbookAdministratorApp.getContentPane().add(lblPassword);
		
		JButton btnOk = new JButton("OK");
		btnOk.setBounds(156, 73, 89, 23);
		btnOk.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0){
				
				ResultSet rs = connect.query("select * from admininfo");
				
				try {
					rs.first();
					String password = rs.getString("password");
					String username = rs.getString("username");
					
					if(txtUsername.getText().equals(username) && txtPassword.getText().equals(password)){
						//JOptionPane.showMessageDialog(frmMagicbookAdministratorApp, "OK");
						MainWindow mw = new MainWindow(connect);
						frmMagicbookAdministratorApp.dispose();
						mw.getJFrame().setVisible(true);
					}
					else
						JOptionPane.showMessageDialog(frmMagicbookAdministratorApp, "Error - wrong username and/or password!");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		});
		
		frmMagicbookAdministratorApp.getContentPane().add(btnOk);
		
		JButton btnCancel = new JButton("Cancel");
		btnCancel.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				connect.closeConnection();
				System.exit(0);
			}
		});
		btnCancel.setBounds(255, 73, 89, 23);
		frmMagicbookAdministratorApp.getContentPane().add(btnCancel);
		
		txtUsername = new JTextField();
		txtUsername.setBounds(119, 11, 225, 20);
		frmMagicbookAdministratorApp.getContentPane().add(txtUsername);
		txtUsername.setColumns(10);
		
		txtPassword = new JPasswordField();
		txtPassword.setBounds(119, 42, 225, 20);
		frmMagicbookAdministratorApp.getContentPane().add(txtPassword);
	}
}
