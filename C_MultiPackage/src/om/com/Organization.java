package om.com;

public class Organization {
	private String orgName;
	
	private String loc;
	
	private int empNo;

	public Organization(String orgName, String loc, int empNo) {
		this.orgName = orgName;
		this.loc = loc;
		this.empNo = empNo;
	}

	@Override
	public String toString() {
		return "Organization [orgName=" + orgName + ", loc=" + loc + ", empNo=" + empNo + "]";
	}
	
}
