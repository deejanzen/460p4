package dbController;

public class partRecord{
	private String partID = "";
	private String partName = "";
	private int partPrice = 0;
	
	public partRecord(String partID, String partName, int partPrice){
		this.partID = partID;
		this.partName = partName;
		this.partPrice = partPrice;
	}
	
	public String get_partID() {
		return this.partID;
	}
	
	public String get_partName() {
		return this.partName;
	}
	
	public int get_partPrice() {
		return this.partPrice;
	}
}