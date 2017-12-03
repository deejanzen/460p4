package dbController;

public class buildRecord{
	private String orderID = "";
	private String partID = "";
	private String status = "";
		
	public buildRecord(String orderID, String partID, String status){
		this.orderID = orderID;
		this.partID = partID;
		this.status = status;
	}
	
	public String get_partID() {
		return this.partID;
	}
		
	public String get_orderID() {
		return this.orderID;
	}
	
	public String get_status() {
		return this.status;
	}
}