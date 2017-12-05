package dbController;

public class customerRecord{
	private String custID = "";
	private String firstName = "";
	private String lastName = "";
	private String email = "";

	public customerRecord(String custID, String firstName, String lastName, String email){
		this.custID = custID;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
	}
	
	public String get_custID() {
		return this.custID;
	}
	
	public String get_firstName() {
		return this.firstName;
	}
		
	public String get_lastName() {
		return this.lastName;
	}

	public String get_email() {
		return this.email;
	}
}