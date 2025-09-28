package Model;

import java.io.InputStream;

public class UpdateModel {
	private String title;
	private String newtitle;
	private String newtype;
	private String newdec;
	private String newGenre;
	private int newYear;
	private InputStream newimg;
	
	
	public String getNewtitle() {
		return newtitle;
	}
	public void setNewtitle(String newtitle) {
		this.newtitle = newtitle;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNewtype() {
		return newtype;
	}
	public void setNewtype(String newtype) {
		this.newtype = newtype;
	}
	public String getNewdec() {
		return newdec;
	}
	public void setNewdec(String newdec) {
		this.newdec = newdec;
	}
	public InputStream getNewimg() {
		return newimg;
	}
	public void setNewimg(InputStream newimg) {
		this.newimg = newimg;
	}
	public String getNewGenre() {
		return newGenre;
	}
	public void setNewGenre(String newGenre) {
		this.newGenre = newGenre;
	}
	public int getNewYear() {
		return newYear;
	}
	public void setNewYear(int newYear) {
		this.newYear = newYear;
	}
	
	
}
