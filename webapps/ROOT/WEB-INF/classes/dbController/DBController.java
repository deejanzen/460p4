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
	
	// List all the parts available in Part Table	---------------- UNDONE
	public ArrayList<partRecord> show_available_part(String deptName) {
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
	
	public int checkOrderProgress(String orderID) {
		// get the corresponding build list
		ArrayList<buildRecord> build_list = new ArrayList<buildRecord>();
		String listBuildQueryStr = ""
									+ "SELECT * "
									+ "FROM yuanma.Build "
									+ "WHERE yuanma.Build.ORDERNO = '" + orderID + "'";
		try {
			ResultSet rs = stmt.executeQuery(listBuildQueryStr);
			while(rs.next()){
				build_list.add(new buildRecord(rs.getString(1), "", "", rs.getString(3)));
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//return build_list.size();
		
		// Check if all parts are installed

		for (int i = 0; i < build_list.size(); i++){
			if (build_list.get(i).get_status().equals("F")){
				return -1;
			}
		}

		
		// update the order status in Contract Order Table

		String updateContractOrderStatusQueryStr = ""
												+ "UPDATE yuanma.ContractOrder "
												+ "SET yuanma.ContractOrder.Status='COMPLETED' "
												+ "WHERE yuanma.ContractOrder.ORDERNO='" + orderID + "'";
		try {
			stmt.executeQuery(updateContractOrderStatusQueryStr);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		

		return 0;
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
	
	public int getPartPrice(String partName) {
		String listPartQueryStr = ""
									+ "SELECT * "
									+ "FROM yuanma.Part "
									+ "WHERE yuanma.Part.PARTNAME='" + partName + "'";
		try {
			ResultSet rs = stmt.executeQuery(listPartQueryStr);
			rs.next();
			int curPrice = rs.getInt(3);
			rs.close();
			return curPrice;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;	
	}
	
	public int getPartPriceByID(String partID) {
		String listPartQueryStr = ""
									+ "SELECT * "
									+ "FROM yuanma.Part "
									+ "WHERE yuanma.Part.PARTNO='" + partID + "'";
		try {
			ResultSet rs = stmt.executeQuery(listPartQueryStr);
			rs.next();
			int curPrice = rs.getInt(3);
			rs.close();
			return curPrice;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;	
	}
	
	public int getBasePrice(String orderID) {
		String getBasePriceQueryStr = ""
									+ "SELECT yuanma.Department.LaborCost "
									+ "FROM (yuanma.Department "
									+ "JOIN yuanma.ContractOrder "
									+ "ON yuanma.Department.deptName=yuanma.ContractOrder.deptName) "
									+ "WHERE yuanma.ContractOrder.orderNo='" + orderID + "'"; 
		try {
			ResultSet rs = stmt.executeQuery(getBasePriceQueryStr);
			rs.next();
			int basePrice = rs.getInt(1);
			rs.close();
			return basePrice;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;	
	}

	public int getBasePriceByName(String shipName) {
		String getBasePriceQueryStr = ""
									+ "SELECT yuanma.Department.LaborCost "
									+ "FROM yuanma.Department "
									+ "WHERE yuanma.Department.Model='" + shipName + "'";
		try {
			ResultSet rs = stmt.executeQuery(getBasePriceQueryStr);
			rs.next();
			int basePrice = rs.getInt(1);
			rs.close();
			return basePrice;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;	
	}	

		
	
	public int updatePartPrice(String partName, String partPrice) {
		String updatePartPriceQueryStr = ""
										+ "UPDATE yuanma.Part "
										+ "SET yuanma.Part.PRICE='" + partPrice + "' "
										+ "WHERE yuanma.Part.PARTNAME='" + partName + "'"; 
		try {
			stmt.executeQuery(updatePartPriceQueryStr);
			return 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;	
	}
	
	// List all the contract in the contract Table
	public ArrayList<contractRecord> show_all_contract() {
		ArrayList<contractRecord> contr_list = new ArrayList<contractRecord>();
		String listAllContrQueryStr = ""
									+ "SELECT * "
									+ "FROM yuanma.Contract";
		try {
			ResultSet rs = stmt.executeQuery(listAllContrQueryStr);
			while(rs.next()){
				contr_list.add(new contractRecord(rs.getString(1), rs.getString(2), rs.getString(3)));
			}
			rs.close();
			return contr_list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;		
	}
	
	// List all the order in the order Table
	public ArrayList<orderRecord> show_all_order() {
		ArrayList<orderRecord> order_list = new ArrayList<orderRecord>();
		String listAllOrderQueryStr = ""
									+ "SELECT * "
									+ "FROM yuanma.ContractOrder";
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
	
	public String orderIDGenerator() {
		// get the part list
		ArrayList<orderRecord> order_list = show_all_order();
		int maxID_int = 0;
		
		// find the largest part id
		for (int i = 0; i < order_list.size(); i ++) {
			// extract the part ID from the record
			orderRecord record = order_list.get(i);
			String orderID = record.get_orderID();
			
			// get the number part
			//String orderID_prefix = orderID.substring(0, 3);
			String orderID_num = orderID.substring(3);
			
			// convert number part to int
			int orderID_int  = Integer.parseInt(orderID_num);
			
			// compare
			if (orderID_int > maxID_int) {
				maxID_int = orderID_int;
			}
		}
		
		// convert the int into string
		String maxID_num = String.format("%04d", maxID_int + 1);
		
		// add prefix
		String maxOrderID = "ORD" + maxID_num;
		
		return maxOrderID;
		
	}
	
	public String contrIDGenerator() {
		// get the part list
		ArrayList<contractRecord> contr_list = show_all_contract();
		int maxID_int = 0;
		
		// find the largest part id
		for (int i = 0; i < contr_list.size(); i ++) {
			// extract the part ID from the record
			contractRecord record = contr_list.get(i);
			String contrID = record.get_contrID();
			
			// get the number part
			//String contrID_prefix = contrID.substring(0, 3);
			String contrID_num = contrID.substring(3);
			
			// convert number part to int
			int contrID_int  = Integer.parseInt(contrID_num);
			
			// compare
			if (contrID_int > maxID_int) {
				maxID_int = contrID_int;
			}
		}
		
		// convert the int into string
		String maxID_num = String.format("%04d", maxID_int + 1);
		
		// add prefix
		String maxContrID = "CTR" + maxID_num;
		
		return maxContrID;
		
	}	
	
	
	
	public int verify_customerID(String custID) {
		String listCustQueryStr = ""
								+ "SELECT COUNT(1) "
								+ "FROM yuanma.Customer "
								+ "WHERE yuanma.Customer.CustNO='" + custID + "'";
		try {
			ResultSet rs = stmt.executeQuery(listCustQueryStr);
			
			// Check if the partName exist
			if (rs.next() == false) {
				return -1;
			}
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
	
	public String custIDGenerator() {
		// get the part list
		ArrayList<customerRecord> cust_list = show_all_customer();
		int maxID_int = 0;
		
		// find the largest part id
		for (int i = 0; i < cust_list.size(); i ++) {
			// extract the part ID from the record
			customerRecord record = cust_list.get(i);
			String custID = record.get_custID();
			
			// get the number part
			//String custID_prefix = custID.substring(0, 3);
			String custID_num = custID.substring(3);
			
			// convert number part to int
			int custID_int  = Integer.parseInt(custID_num);
			
			// compare
			if (custID_int > maxID_int) {
				maxID_int = custID_int;
			}
		}
		
		// convert the int into string
		String maxID_num = String.format("%04d", maxID_int + 1);
		
		// add prefix
		String maxCustID = "CT" + maxID_num;
		
		return maxCustID;
		
	}
	
	// List all the order in the order Table
	public ArrayList<customerRecord> show_all_customer() {
		ArrayList<customerRecord> cust_list = new ArrayList<customerRecord>();
		String listAllCustQueryStr = ""
									+ "SELECT * "
									+ "FROM yuanma.Customer";
		try {
			ResultSet rs = stmt.executeQuery(listAllCustQueryStr);
			while(rs.next()){
				cust_list.add(new customerRecord(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			}
			rs.close();
			return cust_list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;		
	}
	
	public int addNewCustomer(String custID, String fname, String lname, String email){
	
		String addNewCustomerQueryStr = ""
									+ "INSERT INTO yuanma.Customer "
									+ "VALUES ('" + custID + "', '" + fname + "', '" + lname + "', '" + email + "')";
		try {
			stmt.executeQuery(addNewCustomerQueryStr);
			return 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return -1;			
	}
	
	// List all the contract in the contract Table
	public ArrayList<contractRecord> show_all_contractByCustID(String custID) {
		ArrayList<contractRecord> contr_list = new ArrayList<contractRecord>();
		String listContrQueryStr = ""
								+ "SELECT * "
								+ "FROM yuanma.Contract "
								+ "WHERE yuanma.Contract.CustNo='" + custID + "'";
		try {
			ResultSet rs = stmt.executeQuery(listContrQueryStr);
			while(rs.next()){
				contr_list.add(new contractRecord(rs.getString(1), rs.getString(2), rs.getString(3)));
			}
			rs.close();
			return contr_list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;		
	}
	
	// List all the contract in the contract Table
	public ArrayList<orderRecord> show_all_orderByContract(String contrID) {
		ArrayList<orderRecord> order_list = new ArrayList<orderRecord>();
		String listOrderQueryStr = ""
								+ "SELECT * "
								+ "FROM yuanma.ContractOrder "
								+ "WHERE yuanma.ContractOrder.ContrNo='" + contrID + "'";
		try {
			ResultSet rs = stmt.executeQuery(listOrderQueryStr);
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
	
}
	