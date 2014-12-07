package magicbookGUI;

import java.sql.PreparedStatement;
import java.sql.Savepoint;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnect {
	
	static private Connection conn;
	private Statement st;
	private ResultSet rs;
	private PreparedStatement ps;

	
	static String driver = "com.mysql.jdbc.Driver";
	static String user = "root";
	static String password = "";
	static String url = "jdbc:mysql://localhost/magicbookdb";
	
	public DBConnect()
	{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection(url, user, password);
			
			st = conn.createStatement();
			//st = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			
		} catch(Exception e)
		{
			System.out.println("Error " + e);
		}
	}
	
	public Savepoint setSavepoint() throws SQLException{
			conn.setAutoCommit(false);
			return conn.setSavepoint();
	}
	
	public void commit(){
		try {
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void rollback(Savepoint savepoint)
	{
		try {
			conn.rollback(savepoint);
			conn.setAutoCommit(true);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public PreparedStatement getPreparedStatement(String query) throws SQLException
	{
		conn.setAutoCommit(false);
		ps = conn.prepareStatement(query);
		return ps;
	}
	public void closePreparedStatement() throws SQLException{
		ps.close();
		conn.setAutoCommit(true);
	}
	
	public void closeConnection()
	{
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ResultSet query(String query){
		try{
			rs = st.executeQuery(query);
			
			return rs;
			
		}catch(Exception e){
			System.out.println(e);
			return null;
		}
	}
	
	public void executeUpdate(String statement){
		try {
			st.executeUpdate(statement);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
