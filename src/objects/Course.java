package objects;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.awt.Color;

/**
 * class Course: contains all relevant information regarding an individual course.  Specifically, its
 * id in the database, name, department/number/section, basic details and the times it is offered
 * (as Time objects).
 */

public class Course {

	Integer id = null;
	String department = null;
	String title = null;
	String number = null;
	String section = null;
	String details = null;
	ArrayList<Time> times = new ArrayList<Time>();

	String credits = null;
	String FDR = null;
	String type = null;
	String faculty = null;
	String instrConsent = null;
	Integer expectCap = null;
	String location = null;

	public void setID(Integer ID) {
		this.id = ID;
	}

	public void setDepartment(String dept) {
		this.department = dept;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setNumber(String num) {
		this.number = num;
	}

	public void setSection(String sec) {
		this.section = sec;
	}

	public void setDetails(String det) {
		this.details = det;
	}

	public void setCredits(String cred) {
		this.credits = cred;
	}

	public void setFDR(String fdr) {
		if (fdr == null) {
			this.FDR = "";
		} else {
			this.FDR = fdr;
		}
	}

	public void setType(String typ) {
		if (typ == null) {
			this.type = "";
		} else {
			this.type = typ;
		}
	}

	public void setFaculty(String fac) {
		if (fac == null) {
			this.faculty = "";
		} else {
			this.faculty = fac;
		}
	}

	public void setInstrConsent(String ins) {
		this.instrConsent = ins;
	}

	public void setExpectCap(Integer cap) {
		this.expectCap = cap;
	}

	public void setLocation(String loc) {
		if (loc == null) {
			this.location = "";
		} else {
			this.location = loc;
		}
	}

	public void setTimes(ArrayList<Time> times) {
		this.times = times;
	}

	public void addTime(char d, Integer s, Integer e) {
		times.add(new Time(d, s, e));
	}

	public Integer getId() {
		return this.id;
	}

	public String getTitle() {
		return this.title;
	}

	public String getDepartment() {
		return this.department;
	}

	public String getNumber() {
		return this.number;
	}

	public String getSection() {
		return this.section;
	}

	public String getCredits() {
		return this.credits;
	}

	public String getFDR() {
		return this.FDR;
	}

	public String getType() {
		return this.type;
	}

	public String getFaculty() {
		return this.faculty;
	}

	public String getInstrConsent() {
		return this.instrConsent;
	}

	public Integer getExpectCap() {
		return this.expectCap;
	}

	public String getLocation() {
		return this.location;
	}

	public String getDetails() {
		return this.details;
	}

	public ArrayList<Time> getTimes() {
		return this.times;
	}


	public ArrayList<String> getPrettyTimes() {
		ArrayList<String> prettyTimes = new ArrayList<String>();
		for (Time time : this.times) {
			prettyTimes.add(time.getPrettyTime());
		}
		return prettyTimes;
	}

	public static String generateColorList(int n) {
		StringBuilder ret = new StringBuilder("[");
		for (int i = 0; i < n; i++) {
			float hue = ((i) / (float) n) % 1;
			// float saturation = (.25f + (.50f * i)) % n;
			// float brightness = .5f;
			float saturation = .5f;
			float brightness = .9f;
			Color color = Color.getHSBColor(hue, saturation, brightness);
			ret.append("\"rgb(" + color.getRed() + ", " + color.getGreen()
					+ ", " + color.getBlue() + ")\",");
		}
		ret.append("]");
		return new String(ret.deleteCharAt(ret.length() - 2));
	}
	
	/*Definition of time block:  distinct period of time that a course is held for one or more days of 
	 * the week.  Thus this may have equivalent information to one or more Time() objects, but with
	 * a set of days instead of a single day.
	 * getTimeBlocks(): returns each time block formatted in the same style as the Registrar.
	 */
	public Map<String, Set<Character>>getTimeBlocks(){
		Map<String, Set<Character>> timeblocks = new HashMap<String,Set<Character>>();
		
		for(Time time: this.getTimes()){
			String startend= Integer.toString(time.getStarttime()) + "-" + Integer.toString(time.getEndtime());
			if(timeblocks.containsKey(startend)){
				timeblocks.get(startend).add(time.getDay());
			}
			else{
				HashSet<Character> newSet = new HashSet<Character>();
				newSet.add(time.getDay());
				timeblocks.put(startend, newSet);
			}
		}
		return timeblocks;
		
	}

	public static void main(String args[]) {
		System.out.println(generateColorList(10));
	}

}
