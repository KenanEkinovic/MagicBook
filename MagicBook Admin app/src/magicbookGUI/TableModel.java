package magicbookGUI;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Vector;

import javax.swing.table.AbstractTableModel;

class TableModel extends AbstractTableModel {
	  Vector cache; // will hold String[] objects . . .

	  int colCount;

	  String[] headers;

	  Connection db;

	  Statement statement;

	  public TableModel() {
	    cache = new Vector();
	  }

	  public String getColumnName(int i) {
	    return headers[i];
	  }

	  public int getColumnCount() {
	    return colCount;
	  }

	  public int getRowCount() {
	    return cache.size();
	  }

	  public Object getValueAt(int row, int col) {
	    return ((String[]) cache.elementAt(row))[col];
	  }

	  public void executeQuery(String q) {
	    cache = new Vector();
	    try {
	      ResultSet rs = conn.query(q);
	      ResultSetMetaData meta = rs.getMetaData();
	      colCount = meta.getColumnCount();

	      //column names
	      headers = new String[colCount];
	      for (int h = 1; h <= colCount; h++) {
	        headers[h - 1] = meta.getColumnName(h);
	      }
	      
	      while (rs.next()) {
	        String[] record = new String[colCount];
	        for (int i = 0; i < colCount; i++) {
	          record[i] = rs.getString(i + 1);
	        }
	        cache.addElement(record);
	      }

	    } catch (Exception e) {
	      cache = new Vector();
	      e.printStackTrace();
	    }
	  }
	  
	  private DBConnect conn;

	  public void setConnection(DBConnect connection) {
		  conn = connection;
	  }
	}