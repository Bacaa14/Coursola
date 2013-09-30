package objects;

/**
 * Class Time:  object containing day, starting time, and ending time for a particular course time slot.
 */

public class Time {
	char day;
	Integer starttime;
	Integer endtime;

	public Time(char d, Integer s, Integer e) {
		this.day = d;
		this.starttime = s;
		this.endtime = e;
	}

	public char getDay() {
		return this.day;
	}

	public int getStarttime() {
		return this.starttime;
	}

	public int getEndtime() {
		return this.endtime;
	}
	
	public String getPrettyTime(){
		String st = formatTime(this.starttime);
		String et = formatTime(this.endtime);
		return String.valueOf(this.day) + ' ' + st + '-' + et;
	}
	
	public String formatTime(Integer time){
		Integer hours = (int) Math.floor(time/60); 
		Integer minutes = time % 60;
		String m = "a";
		String mins = minutes.toString();
		if(hours > 12){
			m = "p";
			hours -= 12;
		}
		if(minutes < 10){
			mins = "0" + minutes.toString();
		}
		return hours.toString() + ":" + mins + m;
	}
}