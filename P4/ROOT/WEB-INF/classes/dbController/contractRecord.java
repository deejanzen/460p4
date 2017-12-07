package dbController;

public class contractRecord{
	private String contrID = "";
	private String contrDate = "";
	private String customerID = "";

	public contractRecord(String contrID, String contrDate, String customerID){
		this.contrID = contrID;
		this.contrDate = contrDate;
		this.customerID = customerID;
	}
	
	public String get_contrID() {
		return this.contrID;
	}
	
	public String get_contrDate() {
		return this.contrDate;
	}
		
	public String get_customerID() {
		return this.customerID;
	}
}