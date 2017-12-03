package dbController;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

public class DBController {
	final String userName ="tangmac";
	final String password ="a1234";
	final String oracle_URL ="jdbc:oracle:thin:@aloe.cs.arizona.edu:1521:oracle";
	Connection connection;
	Statement stmt;
	
	public DBController(){
		
	}
	
	public void connect(){
		try {
		    Class.forName("oracle.jdbc.OracleDriver");
		    connection = DriverManager.getConnection(oracle_URL, userName, password);
		    stmt = connection.createStatement();
		    return;
		} catch (SQLException sqlex) {
		    sqlex.printStackTrace();
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		    System.exit(1);
		} catch (Exception ex) {
		    ex.printStackTrace();
		    System.exit(2);
		}
	}
	
	public void disconnect(){
		try {
		      stmt.close();
		      connection.close();
		    } catch (SQLException e) {
		      e.printStackTrace();
		    }
		    connection = null;
	}
	
	// List all of the department in the Department Table
	public ArrayList<deptRecord> show_all_dept() {
		ArrayList<deptRecord> dept_list = new ArrayList<deptRecord>();
		String listAllDeptQueryStr = "SELECT * From yuanma.Department";
		try {
			ResultSet rs = stmt.executeQuery(listAllDeptQueryStr);
			while(rs.next()){
				dept_list.add(new deptRecord(rs.getString(1), rs.getString(2), rs.getInt(3)));
			}
			rs.close();
			return dept_list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;		
	}
		
	// method to verify if the department is exist
	public int verify_department(String newDeptName){
		String listDeptQueryStr = ""
								+ "SELECT COUNT(1) "
								+ "FROM yuanma.Department "
								+ "WHERE DeptName ='" + newDeptName + "'";
		try {
			ResultSet rs = stmt.executeQuery(listDeptQueryStr);
			// Check if the deptname exist
			rs.next();
			int count = rs.getInt(1);
			rs.close();
			return count;
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 1;
	}
	
	// List all the parts available in Part Table
	public ArrayList<partRecord> show_all_part() {
		ArrayList<partRecord> part_list = new ArrayList<partRecord>();
		String listAllPartQueryStr = "SELECT * From yuanma.Part";
		try {
			ResultSet rs = stmt.executeQuery(listAllPartQueryStr);
			while(rs.next()){
				part_list.add(new partRecord(rs.getString(1), rs.getString(2), rs.getInt(3)));
			}
			rs.close();
			return part_list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;		
	}
	
	// List all the parts available in Part Table
	public ArrayList<orderRecord> show_all_order() {
		ArrayList<orderRecord> order_list = new ArrayList<orderRecord>();
		String listAllOrderQueryStr = "SELECT * From yuanma.ContractOrder";
		try {
			ResultSet rs = stmt.executeQuery(listAllOrderQueryStr);
			while(rs.next()){
				order_list.add(new orderRecord(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			}
			rs.close();
			return order_list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;		
	}
	
	// List all the build in the Build Table
	public ArrayList<buildRecord> show_all_build() {
		ArrayList<buildRecord> build_list = new ArrayList<buildRecord>();
		String listAllBuildQueryStr = ""
									+ "SELECT ORDERNO, PARTNAME, INSTALL "
									+ "FROM (yuanma.Build "
									+ "LEFT JOIN yuanma.Part "
									+ "ON yuanma.Build.PARTNO=yuanma.Part.PARTNO)";
		try {
			ResultSet rs = stmt.executeQuery(listAllBuildQueryStr);
			while(rs.next()){
				build_list.add(new buildRecord(rs.getString(1), rs.getString(2), rs.getString(3)));
			}
			rs.close();
			return build_list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;		
	}
	
	public void updateOrderProgress(String orderID, String partName, String status){
	}
	
}
	