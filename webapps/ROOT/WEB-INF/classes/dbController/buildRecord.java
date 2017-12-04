package dbController;

public class buildRecord{
	private String orderID = "";
	private String partID = "";
	private String status = "";
	private String partName = "";
		
	public buildRecord(String orderID, String partID, String partName, String status){
		this.orderID = orderID;
		this.partID = partID;
		this.partName = partName;
		this.status = status;
	}
	
	public String get_partID() {
		return this.partID;
	}
	
	public String get_partName() {
		return this.partName;
	}
		
	public String get_orderID() {
		return this.orderID;
	}
	
	public String get_status() {
		return this.status;
	}
}