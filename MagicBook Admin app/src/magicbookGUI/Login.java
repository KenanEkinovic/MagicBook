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
import javax.swing.JPanel;
import java.awt.FlowLayout;
import com.jgoodies.forms.layout.FormLayout;
import com.jgoodies.forms.layout.ColumnSpec;
import com.jgoodies.forms.layout.RowSpec;
import com.jgoodies.forms.factories.FormFactory;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.SwingConstants;
import java.awt.BorderLayout;
import javax.swing.border.TitledBorder;
import javax.swing.border.MatteBorder;
import java.awt.Color;

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
		frmMagicbookAdministratorApp.setBounds(100, 100, 412, 167);
		frmMagicbookAdministratorApp.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frmMagicbookAdministratorApp.getContentPane().setLayout(null);
		
		JPanel panel_2 = new JPanel();
		panel_2.setBorder(new TitledBorder(new MatteBorder(4, 4, 4, 4, (Color) new Color(51, 153, 255)), "Login", TitledBorder.LEADING, TitledBorder.TOP, null, new Color(255, 0, 0)));
		panel_2.setBounds(10, 0, 386, 131);
		frmMagicbookAdministratorApp.getContentPane().add(panel_2);
		panel_2.setLayout(null);
		
		JPanel panel_1 = new JPanel();
		panel_1.setBounds(10, 58, 366, 32);
		panel_2.add(panel_1);
		panel_1.setLayout(new BorderLayout(20, 0));
		
		JLabel lblPassword = new JLabel("Password:");
		panel_1.add(lblPassword, BorderLayout.WEST);
		
		txtPassword = new JPasswordField();
		panel_1.add(txtPassword, BorderLayout.CENTER);
		
		JPanel panel = new JPanel();
		panel.setBounds(10, 22, 366, 32);
		panel_2.add(panel);
		panel.setLayout(new BorderLayout(20, 0));
		
		JLabel lblUsername = new JLabel("Username:");
		panel.add(lblUsername, BorderLayout.WEST);
		
		txtUsername = new JTextField();
		panel.add(txtUsername);
		txtUsername.setColumns(10);
		
		JButton btnOk = new JButton("OK");
		btnOk.setBounds(209, 97, 80, 23);
		panel_2.add(btnOk);
		
		JButton btnCancel = new JButton("Cancel");
		btnCancel.setBounds(296, 97, 80, 23);
		panel_2.add(btnCancel);
		btnCancel.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				connect.closeConnection();
				System.exit(0);
			}
		});
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
	}
}
