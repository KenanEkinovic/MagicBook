package magicbookGUI;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;

import java.awt.Component;

import javax.swing.Box;
import javax.swing.JTable;
import javax.swing.JList;
import javax.swing.JLabel;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.JButton;

import java.awt.GridBagLayout;
import java.awt.GridBagConstraints;
import java.awt.Insets;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Color;
import java.awt.Font;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class MainWindow {
	
	public static Connection conn;

	private JFrame frmHeartstone;
	private JTable table;
	private JList list;
	private JLabel lblCards;
	private JLabel lblLadder;
	private JButton btnUpdateDatabase;
	private JButton btnUndo;
	private JButton btnSaveChanges;
	private JButton btnSendMessage;
	static private DBConnect connect;
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		
		connect = new DBConnect();
				
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					MainWindow window = new MainWindow();
					window.getJFrame().setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public MainWindow() {
		initialize();
	}
	
	public MainWindow(Connection connection){
		initialize();
		conn = connection;
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		setJFrame(new JFrame());
		getJFrame().setTitle("MagicBook:Heartstone Administrator App");
		getJFrame().setBackground(new Color(95, 158, 160));
		getJFrame().setBounds(100, 100, 503, 322);
		getJFrame().setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		getJFrame().getContentPane().setLayout(null);
		
		table = new JTable();
		table.setBounds(10, 29, 322, 210);
		getJFrame().getContentPane().add(table);
		
		List <String> lista;
		lista= new ArrayList<String>();
		
		ResultSet rs = connect.query("select * from `players in ladder`");
		
		
		try {
			while(rs.next()){
				  lista.add(rs.getString("Username"));
				  
				}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	
		
		list = new JList(lista.toArray());
		list.setBounds(342, 28, 135, 211);
		getJFrame().getContentPane().add(list);
		
		lblCards = new JLabel("Cards");
		lblCards.setFont(new Font("Tahoma", Font.PLAIN, 11));
		lblCards.setBounds(10, 11, 46, 14);
		getJFrame().getContentPane().add(lblCards);
		
		lblLadder = new JLabel("Ladder");
		lblLadder.setFont(new Font("Tahoma", Font.PLAIN, 11));
		lblLadder.setBounds(342, 11, 46, 14);
		getJFrame().getContentPane().add(lblLadder);
		
		btnUpdateDatabase = new JButton("Update database");
		btnUpdateDatabase.setFont(new Font("Tahoma", Font.PLAIN, 11));
		btnUpdateDatabase.setForeground(new Color(255, 255, 255));
		btnUpdateDatabase.setBackground(new Color(95, 158, 160));
		btnUpdateDatabase.setBounds(10, 250, 121, 23);
		getJFrame().getContentPane().add(btnUpdateDatabase);
		
		btnUndo = new JButton("Undo");
		btnUndo.setFont(new Font("Tahoma", Font.PLAIN, 11));
		btnUndo.setBounds(243, 250, 89, 23);
		getJFrame().getContentPane().add(btnUndo);
		
		btnSaveChanges = new JButton("Save");
		btnSaveChanges.setForeground(new Color(0, 0, 0));
		btnSaveChanges.setFont(new Font("Tahoma", Font.PLAIN, 11));
		btnSaveChanges.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
			}
		});
		btnSaveChanges.setBounds(154, 250, 89, 23);
		getJFrame().getContentPane().add(btnSaveChanges);
		
		btnSendMessage = new JButton("Send message");
		btnSendMessage.setFont(new Font("Tahoma", Font.PLAIN, 11));
		btnSendMessage.setBounds(342, 250, 135, 23);
		getJFrame().getContentPane().add(btnSendMessage);
	}

	public JFrame getJFrame() {
		return frmHeartstone;
	}

	public void setJFrame(JFrame frmHeartstone) {
		this.frmHeartstone = frmHeartstone;
	}
}
