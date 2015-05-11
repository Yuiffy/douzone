package sql;

import java.sql.Date;

public class BookInfo {
	private String Title,Publisher;
	private int ISBN,AuthorID;
	private double Price;
	private String PublishDate;
	
	public BookInfo(){
		Title=Publisher=PublishDate="";
		ISBN=AuthorID=0;
		Price=0;
	}
	
	public BookInfo(int I,String T,int A,String Per,Date D,double P){
		this.setISBN(I);
		this.setTitle(T);
		this.setAuthorID(A);
		this.setPublisher(Per);
		this.setPublishDate(D.toString());
		this.setPrice(P);
	}

	public void setPublisher(String publisher) {
		Publisher = publisher;
	}

	public String getPublisher() {
		return Publisher;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getTitle() {
		return Title;
	}

	public void setISBN(int iSBN) {
		ISBN = iSBN;
	}

	public int getISBN() {
		return ISBN;
	}

	public void setAuthorID(int authorID) {
		AuthorID = authorID;
	}

	public int getAuthorID() {
		return AuthorID;
	}

	public void setPrice(double price) {
		Price = price;
	}

	public double getPrice() {
		return Price;
	}

	public void setPublishDate(String publishDate) {
		PublishDate = publishDate;
	}

	public String getPublishDate() {
		return PublishDate;
	}
}
