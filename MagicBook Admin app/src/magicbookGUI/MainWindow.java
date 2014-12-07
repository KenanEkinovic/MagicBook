package magicbookGUI;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.Box;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JButton;

import java.awt.Dimension;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Color;
import java.awt.Font;
import java.sql.Connection;
import java.util.ArrayList;

import javax.swing.JPanel;

import java.awt.BorderLayout;

import javax.swing.SwingConstants;
import javax.swing.border.MatteBorder;
import javax.swing.border.TitledBorder;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.table.TableColumnModel;
import javax.swing.BoxLayout;
import javax.swing.ScrollPaneConstants;
import javax.swing.ListSelectionModel;

public class MainWindow {
	
	public static Connection conn;

	private JFrame frmHeartstone;
	private JTable tableCard;
	private JTable tablePlayer;
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
	
	TableModel tmCard;
	TableModel tmPlayer;
	private JPanel panel_6;
	private JScrollPane scrollPane;
	private JScrollPane scrollPane_1;
	private JPanel panel_7;
	private TableModel initializeTableModel(String query)
	{
		TableModel tm = new TableModel();
		
		tm.setConnection(connect);
		tm.executeQuery(query);
		return tm;
	}

	/**
	 * Initialize the contents of the frame.
	 */

	private void initialize() {
		initializeCardTable();
		initializePlayerTable();
		
		setJFrame(new JFrame());
		getJFrame().setTitle("MagicBook:Heartstone Administrator App");
		getJFrame().setBackground(new Color(95, 158, 160));
		getJFrame().setBounds(100, 100, 864, 508);
		getJFrame().setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		BoxLayout b = new BoxLayout(frmHeartstone.getContentPane(), BoxLayout.X_AXIS);
		
		frmHeartstone.getContentPane().setLayout(b);
		JPanel panel_1 = new JPanel();
		panel_1.setBorder(null);
		frmHeartstone.getContentPane().add(Box.createRigidArea(new Dimension(5,0)));
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
				
				//adding rows into the window table
				tmCard = initializeTableModel("select * from card");
				tableCard = new JTable(tmCard);
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
		btnUndo.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				//get valid data from the database
				tmCard.executeQuery("select * from card");
				//let the table know its model changed
				tmCard.fireTableDataChanged();
			}
		});
		panel_5.add(btnUndo);
		btnUndo.setFont(new Font("Tahoma", Font.PLAIN, 11));
		btnSaveChanges.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
			}
		});
		
		
		panel_6 = new JPanel();
		panel_1.add(panel_6, BorderLayout.CENTER);
		panel_6.setLayout(new BorderLayout(100, 100));
		panel_6.setBorder(new TitledBorder(new MatteBorder(4, 4, 4, 4, (Color) new Color(51, 153, 255)), "Cards", TitledBorder.CENTER, TitledBorder.TOP, null, new Color(255, 0, 0)));
		
		scrollPane = new JScrollPane(tableCard);
		scrollPane.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
		scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
		panel_6.add(scrollPane, BorderLayout.CENTER);
			
			JPanel panel = new JPanel();
			frmHeartstone.getContentPane().add(Box.createHorizontalGlue());
			frmHeartstone.getContentPane().add(Box.createRigidArea(new Dimension(5,0)));
			panel.setMaximumSize(new Dimension(20,8000));
			panel.setPreferredSize(new Dimension(150,8000));
			frmHeartstone.getContentPane().add(panel);
			frmHeartstone.getContentPane().add(Box.createRigidArea(new Dimension(5,0)));
			
			
			panel.setLayout(new BorderLayout(0, 0));
			
			panel_3 = new JPanel();
			panel.add(panel_3, BorderLayout.SOUTH);
			
			btnSendMessage = new JButton("Send message");
			panel_3.add(btnSendMessage);
			btnSendMessage.setFont(new Font("Tahoma", Font.PLAIN, 11));
			
			panel_7 = new JPanel();
			panel.add(panel_7, BorderLayout.CENTER);
			panel_7.setLayout(new BorderLayout(0, 0));
			
			
			scrollPane_1 = new JScrollPane(tablePlayer);
			scrollPane_1.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
			panel_7.add(scrollPane_1);
			panel_7.setBorder(new TitledBorder(new MatteBorder(4, 4, 4, 4, (Color) new Color(51, 153, 255)), "Ladder", TitledBorder.CENTER, TitledBorder.TOP, null, new Color(255, 0, 0)));
			
			
			
	}

	public JFrame getJFrame() {
		return frmHeartstone;
	}

	public void setJFrame(JFrame frmHeartstone) {
		this.frmHeartstone = frmHeartstone;
	}
	
	//tables
	public void initializePlayerTable()
	{
		tmPlayer = this.initializeTableModel("select * from `players in ladder`");
		tablePlayer = new JTable(tmPlayer);
		tablePlayer.setSelectionMode(ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);
		setMaxColumnWidthPlayerTable();
	}
	public void initializeCardTable()
	{
		tmCard = initializeTableModel("select * from card");
		tmCard.setEditable(true);
		tableCard = new JTable(tmCard);
		tableCard.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		
		/*tableCard.getModel().addTableModelListener(new TableModelListener(){
			@Override
			public void tableChanged(TableModelEvent arg0) {
				//tableCard.setValueAt("ble", arg0.getFirstRow(), arg0.getColumn());
			}});*/
		
		setMaxColumnWidthCardTable();
	}
	
	
	private void setMaxColumnWidthPlayerTable()
	{
		TableColumnModel cm = tablePlayer.getColumnModel();
		cm.getColumn(0).setMaxWidth(80);
		cm.getColumn(1).setMaxWidth(50);
		cm.getColumn(1).setHeaderValue("wins");
	}
	
	private void setMaxColumnWidthCardTable()
	{
		TableColumnModel cm = tableCard.getColumnModel();
		cm.getColumn(0).setMaxWidth(30);
		cm.getColumn(1).setPreferredWidth(70);
		cm.getColumn(2).setMaxWidth(33);
		cm.getColumn(3).setMaxWidth(60);
		cm.getColumn(4).setMaxWidth(60);
		cm.getColumn(5).setMaxWidth(80);
		cm.getColumn(6).setMaxWidth(33);
		cm.getColumn(7).setMaxWidth(40);
		cm.getColumn(8).setMaxWidth(33);
	}
}
