package om;

public class Student {
	private String name;
	
	private int std;
	
	private int marks;
	
	private String city;

	public Student(String name, int std, int marks, String city) {
		super();
		this.name = name;
		this.std = std;
		this.marks = marks;
		this.city = city;
	}

	@Override
	public String toString() {
		return "Student [name=" + name + ", std=" + std + ", marks=" + marks + ", city=" + city + "]";
	}
	
}
