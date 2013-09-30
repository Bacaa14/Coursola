package objects;

import java.util.ArrayList;

/**
 * Contains all relevant information about each user in our database
 * @author lisoviczp
 *
 */

public class Person {
	
	Integer id= null;
	String username = null;
	String password = null;
	String email = null;
	
	
	public void setID (Integer ID) {
		this.id = ID;
	}
	
	public void setUsername (String uname) {
		this.username = uname;
	}
	
	public void setPassword (String pword) {
		this.password = pword;
	}
	
	public void setEmail (String mail) {
		this.email = mail;
	}
	
	public Integer getID() {
		return this.id;
	}
	
	public String getUsername() {
		return this.username;
	}
	
	public String getPassword() {
		return this.password;
	}
	
	public String getEmail () {
		return this.email;
	}
		
}
