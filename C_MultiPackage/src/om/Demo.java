package om;

import om.com.Employee;
import om.com.Organization;

public class Demo {
	public static void main(String[] args) {
		
		Organization organization = new Organization("TechM", "Pune", 80000);
		
		Employee emp = new Employee("omkar", 22000, 1, "Pune", organization);
		
		System.out.println("New Employeee is created");
		System.out.println(emp);
	}
}
