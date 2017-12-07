package dbController;

public class orderRecord{
	private String orderID = "";
	private String contractID = "";
	private String deptName = "";
	private String status = "";
		
	public orderRecord(String orderID, String contractID, String deptName, String status){
		this.orderID = orderID;
		this.contractID = contractID;
		this.deptName = deptName;
		this.status = status;
	}
	
	public String get_contractID() {
		return this.contractID;
	}
	
	public String get_deptName() {
		return this.deptName;
	}
	
	public String get_orderID() {
		return this.orderID;
	}
	
	public String get_status() {
		return this.status;
	}
}