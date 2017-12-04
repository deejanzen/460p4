package dbController;

import java.sql.*;
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
		return -1;
	}
	
	// method to verify if the partname is exist
	public int verify_partName(String newPartName){
		String listPartQueryStr = ""
								+ "SELECT COUNT(1) "
								+ "FROM yuanma.Part "
								+ "WHERE Partname ='" + newPartName + "'";
		try {
			ResultSet rs = stmt.executeQuery(listPartQueryStr);
			// Check if the partName exist
			rs.next();
			int count = rs.getInt(1);
			rs.close();
			return count;
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
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
									+ "SELECT ORDERNO, yuanma.Build.PARTNO, PARTNAME, INSTALL "
									+ "FROM (yuanma.Build "
									+ "LEFT JOIN yuanma.Part "
									+ "ON yuanma.Build.PARTNO=yuanma.Part.PARTNO)";
		try {
			ResultSet rs = stmt.executeQuery(listAllBuildQueryStr);
			while(rs.next()){
				build_list.add(new buildRecord(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			}
			rs.close();
			return build_list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;		
	}
	
	public int updateOrderProgress(String orderID, String partNo, String status){
		String updateOrderProgressQueryStr = ""
											+ "UPDATE yuanma.Build "
											+ "SET yuanma.Build.INSTALL='" + status + "' "
											+ "WHERE (yuanma.Build.ORDERNO='" + orderID + "' "
											+ "AND yuanma.Build.PARTNO='" + partNo + "') ";
		try {
			stmt.executeQuery(updateOrderProgressQueryStr);
			return 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 1;												
	}
	
	public int addNewShipToDept(String deptName, String[] partArr, String shipName, String laborFee){
		String addNewShipQueryStr = ""
									+ "INSERT INTO yuanma.Department "
									+ "VALUES ('" + deptName + "', '" + shipName + "', '" + laborFee + "')";
		try {
			stmt.executeQuery(addNewShipQueryStr);
			return 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return -1;												
	}

	public static boolean isInteger(String s) {
		return s.matches("\\d+");
	}	
	
	public int addNewPart(String partName, String partPrice) {
		// generate the id
		String partID = partIDGenerator();
		
		String addNewPartQueryStr = ""
									+ "INSERT INTO yuanma.Part "
									+ "VALUES ('" + partID + "', '" + partName + "', '" + partPrice + "')";
		try {
			stmt.executeQuery(addNewPartQueryStr);
			return 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return -1;												
	}
	
	public String partIDGenerator() {
		// get the part list
		ArrayList<partRecord> part_list = show_all_part();
		int maxID_int = 0;
		
		// find the largest part id
		for (int i = 0; i < part_list.size(); i ++) {
			// extract the part ID from the record
			partRecord record = part_list.get(i);
			String partID = record.get_partID();
			
			// get the number part
			//String partID_prefix = partID.substring(0, 3);
			String partID_num = partID.substring(3);
			
			// convert number part to int
			int partID_int  = Integer.parseInt(partID_num);
			
			// compare
			if (partID_int > maxID_int) {
				maxID_int = partID_int;
			}
		}
		
		// convert the int into string
		String maxID_num = String.format("%04d", maxID_int + 1);
		
		// add prefix
		String maxPartID = "PRT" + maxID_num;
		
		return maxPartID;
		
	}
	
}
	