package magicbookGUI;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;

import javax.swing.table.AbstractTableModel;

class TableModel extends AbstractTableModel {
	ArrayList<ArrayList<Object>> tableData; //String[] objects

	public ArrayList<ArrayList<Object>> getdata(){
		return tableData;
	}
	int colCount;
	boolean editable;

	String[] headers;
	  
	public void setValueAt(Object aValue, int rowIndex, int columnIndex){
		((ArrayList<Object>) tableData.get(rowIndex)).set(columnIndex, aValue);
	}	
	  
	public void setEditable(boolean editable)
	{
		this.editable = editable;
	}

	public TableModel() {
		this.editable = false;
		tableData = new ArrayList<ArrayList<Object>>();
	}

	public String getColumnName(int i) {
		return headers[i];
	}

	public int getColumnCount() {
		return colCount;
	}

	public int getRowCount() {
		return tableData.size();
	}
	  
	@Override
	public boolean isCellEditable(int rowIndex, int columnIndex) {
		if(columnIndex == 0)
			return false;
		return editable;
	}

	public Object getValueAt(int rowIndex, int columnIndex) {
		return ((ArrayList<Object>) tableData.get(rowIndex)).get(columnIndex);
	}

	public void executeQuery(String q) {
		tableData = new ArrayList<ArrayList<Object>>();
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
				ArrayList<Object> row = new ArrayList<Object>();
				for (int i = 0; i < colCount; i++) {
					row.add(rs.getString(i+1));
				}
	        
				tableData.add(row);
			}

		} catch (Exception e) {
			tableData = new ArrayList<ArrayList<Object>>();
			e.printStackTrace();
		}
	}
	  
	private DBConnect conn;

	public void setConnection(DBConnect connection) {
		conn = connection;
	}
}