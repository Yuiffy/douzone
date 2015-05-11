package sql;

public class AuthorInfo {
	private int authorID,age;
	private String name,country;
	public void setAuthorID(int x){
		this.authorID=x;
	}
	public void setAge(int x){
		this.age=x;
	}
	public void setName(String x){
		this.name=x;
	}
	public void setCountry(String x){
		this.country=x;
	}
	public int getAuthorID(){
		return this.authorID;
	}
	public int getAge(){
		return this.age;
	}
	public String getName(){
		return this.name;
	}
	public String getCountry(){
		return this.country;
	}
}
