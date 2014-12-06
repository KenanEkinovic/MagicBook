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
import javax.swing.JSplitPane;
import javax.swing.JPanel;
import java.awt.FlowLayout;
import java.awt.BorderLayout;
import javax.swing.SwingConstants;
import javax.swing.border.BevelBorder;
import javax.swing.border.CompoundBorder;
import javax.swing.UIManager;
import javax.swing.border.EtchedBorder;
import java.awt.SystemColor;
import javax.swing.border.MatteBorder;
import javax.swing.border.TitledBorder;


public class MainWindow {
	
	public static Connection conn;

	private JFrame frmHeartstone;
	private JTable table;
	private JList list;
	private JButton btnUpdateDatabase;
	private JButton btnUndo;
	private JButton btnSaveChanges;
	private JButton btnSendMessage;
	static private DBConnect connect;
	private JPanel panel_3;
	private JPanel panel_4;
	private JPanel panel_5;
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		
		//connect = new DBConnect();
				
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					MainWindow window = new MainWindow(new DBConnect());
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
	public MainWindow(DBConnect connect) {
		this.connect = connect;
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
		getJFrame().setBounds(100, 100, 864, 508);
		getJFrame().setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
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
		frmHeartstone.getContentPane().setLayout(new BorderLayout(5, 0));
		
		JPanel panel = new JPanel();
		frmHeartstone.getContentPane().add(panel, BorderLayout.EAST);
		panel.setLayout(new BorderLayout(0, 0));
		
			
			list = new JList(lista.toArray());
			list.setBorder(new TitledBorder(new MatteBorder(4, 4, 4, 4, (Color) new Color(51, 153, 255)), "Ladder", TitledBorder.CENTER, TitledBorder.TOP, null, new Color(255, 0, 0)));
			panel.add(list, BorderLayout.CENTER);
			
			panel_3 = new JPanel();
			panel.add(panel_3, BorderLayout.SOUTH);
			
			btnSendMessage = new JButton("Send message");
			panel_3.add(btnSendMessage);
			btnSendMessage.setFont(new Font("Tahoma", Font.PLAIN, 11));
			
			JPanel panel_1 = new JPanel();
			panel_1.setBorder(null);
			frmHeartstone.getContentPane().add(panel_1);
			panel_1.setLayout(new BorderLayout(0, 0));
			
			JPanel panel_2 = new JPanel();
			panel_1.add(panel_2, BorderLayout.SOUTH);
			panel_2.setLayout(new BorderLayout(0, 0));
			
			panel_4 = new JPanel();
			panel_2.add(panel_4, BorderLayout.WEST);
			
			btnUpdateDatabase = new JButton("Update database");
			panel_4.add(btnUpdateDatabase);
			btnUpdateDatabase.setHorizontalAlignment(SwingConstants.LEFT);
			btnUpdateDatabase.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent arg0) {
					CardCollector d = new CardCollector(connect);
					d.start();
				}
			});
			btnUpdateDatabase.setFont(new Font("Tahoma", Font.PLAIN, 11));
			btnUpdateDatabase.setForeground(new Color(255, 255, 255));
			btnUpdateDatabase.setBackground(new Color(95, 158, 160));
			
			panel_5 = new JPanel();
			panel_2.add(panel_5, BorderLayout.EAST);
			
			btnSaveChanges = new JButton("Save");
			panel_5.add(btnSaveChanges);
			btnSaveChanges.setForeground(new Color(0, 0, 0));
			btnSaveChanges.setFont(new Font("Tahoma", Font.PLAIN, 11));
			
			btnUndo = new JButton("Undo");
			panel_5.add(btnUndo);
			btnUndo.setFont(new Font("Tahoma", Font.PLAIN, 11));
			btnSaveChanges.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent arg0) {
				}
			});
			
			JTable table = new JTable();
			table.setBorder(new TitledBorder(new MatteBorder(4, 4, 4, 4, (Color) new Color(51, 153, 255)), "Cards", TitledBorder.CENTER, TitledBorder.TOP, null, new Color(255, 0, 0)));
			panel_1.add(table, BorderLayout.CENTER);
	}

	public JFrame getJFrame() {
		return frmHeartstone;
	}

	public void setJFrame(JFrame frmHeartstone) {
		this.frmHeartstone = frmHeartstone;
	}
}
