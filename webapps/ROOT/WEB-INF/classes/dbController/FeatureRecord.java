package dbController;

public class FeatureRecord{
	private String deptName = "";
	private String partNo = "";
	private int price = 0;

	public FeatureRecord(String deptName, String partNo, int price){
		this.deptName = deptName;
		this.partNo = partNo;
		this.price = price;
	}

	public String get_deptName() {
		return this.deptName;
	}

	public String get_partNum() {
		return this.partNo;
	}

	public int get_price() {
		return this.price;
	}
}
