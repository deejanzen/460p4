package dbController;

public class deptRecord{
	private String deptName = "";
	private String modelName = "";
	private int basePrice = 0;
	
	public deptRecord(String deptName, String modelName, int basePrice){
		this.deptName = deptName;
		this.modelName = modelName;
		this.basePrice = basePrice;
	}
	
	public String get_deptName() {
		return this.deptName;
	}
	
	public String get_modelName() {
		return this.modelName;
	}
	
	public int get_basePrice() {
		return this.basePrice;
	}
}