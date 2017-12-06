package dbController;

public class vipRecord{
	private String custID = "";
	private String fname = "";
	private String lname = "";
	private int totalSpent = 0;
		
	public vipRecord(String custID, String fname, String lname, int total){
		this.custID = custID;
		this.fname = fname;
		this.lname = lname;
		this.totalSpent = total;
	}
	
	public String get_custID() {
		return this.custID;
	}
	
	public String get_fname() {
		return this.fname;
	}
		
	public String get_lname() {
		return this.lname;
	}
	
	public int get_totalSpent() {
		return this.totalSpent;
	}
}