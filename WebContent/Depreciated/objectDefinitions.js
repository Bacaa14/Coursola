function intersection(time1, time2) {
	if (time1.day != time2.day) {
		return null;
	}
	start = Math.max(time1.start, time2.start);
	end = Math.min(time1.end, time2.end);
	if (end - start <= 0) {
		return null;
	}
	return new timeBlock(time1.day, start, end);
}

function conflict(time1, time2) {
	/* See if two times conflict. Will return true if two times conflict. */
	if (time1.day == time2.day)
		if ((time2.start <= time1.end && time1.start <= time2.start)
				|| (time1.start <= time2.end && time2.start <= time1.start))
			return true;
		else
			return false;

}

selectedCourses = [];
var colors = [ 'blue', 'red', 'green', 'purple', 'orange', 'yellow' ];
/*
 * This is the sort of thing the servlet should generate. deselectedCourses =
 * [new course(1, "PSYC", "113", "01", "psychology", [new timeBlock("M", 9*60 +
 * 5, 10*60), new timeBlock("T", 9*60 + 5, 10*60), new timeBlock("W", 9*60 + 5,
 * 10*60), new timeBlock("R", 9*60 + 5, 10*60), new timeBlock("F", 9*60 + 5,
 * 10*60)]), new course(2, "CSCI", "335", "01", "computer science", [new
 * timeBlock("M", 10*60 + 10, 12*60 + 10), new timeBlock("T", 10*60 + 10, 12*60 +
 * 10), new timeBlock("W", 10*60 + 10, 12*60 + 10), new timeBlock("R", 10*60 +
 * 10, 12*60 + 10), new timeBlock("T", 13*60 + 30, 15*60 + 30), new
 * timeBlock("R", 13*60 + 30, 15*60 + 30)]) ];
 */

minuteHeight = totalHeight / (endTime - beginTime);

/*
 * findColor wraps around a "circle" of distinct colors. It would be fun to
 * generate this list instead on the server side using an algorithm that finds N
 * 'maximally distinct' colors according to some 'color distance' function like
 * CMC l:c., or just divide the HSV wheel into N segments
 */
var colorindex = 0;
function findColor() {
	color = colors[colorindex % colors.length];
	colorindex += 1;
	return color;
}

function timeBlock(day, start, end) {
	this.courseID = null;
	this.day = day; /* M T W R or F */
	this.start = start; /* Integer minutes from start of day */
	this.end = end; /* Integer minutes from start of day */
	topLocation = (start - beginTime) * minuteHeight;
	height = (end - start) * minuteHeight;
	this.display = document.createElement("div");
	this.display.className = "course";
	this.display.style.height = height + "px";
	this.display.style.top = topLocation + "px";
	this.display.style.position = "absolute";
	this.setBackgroundColor = function(color) {
		this.display.style.backgroundColor = color;
	};
	this.show = function() {
		this.display.style.display = "block";
	};
	this.hide = function() {
		this.display.style.display = "none";
	};
	this.hide();
	dayDiv[day].appendChild(this.display);
}

function conflictBlock(motherID, fatherID, time) {
	this.motherID = motherID;
	this.fatherID = fatherID;
	this.time = time;
	this.time.display.style.backgroundImage = "url(css/redstripe.png)";
	this.time.display.style.zIndex = "2";
	this.time.display.style.backgroundColor = "transparent";
	this.show = function() {
		this.time.show();
	};
	this.hide = function() {
		this.time.hide();
	};

}

function findConflicts(motherTime) {
	ret = [];
	for (i in selectedCourses) {
		for (j in courseMap[selectedCourses[i]].times) {

			potentialConflict = courseMap[selectedCourses[i]].times[j];
			if (conflict(potentialConflict, motherTime)
					&& motherTime.courseID != selectedCourses[i]) {
				ret.push(new conflictBlock(motherTime.courseID,
						selectedCourses[i], intersection(potentialConflict, motherTime)));
			}
		}
	}
	return ret;
}

function course(id, department, number, section, title, times) {
	/* An array of timeBlock objects */
	this.conflicts = [];
	this.id = id;
	this.identifier = department + "-" + number + "-" + section;
	this.title = title;
	this.times = [];
	this.color = findColor();
	this.selected = false;
	this.display = document.createElement("div");
	this.display.className = "courseContainer";
	this.display.style.backgroundColor = this.color;
	this.displayIdentifier = document.createElement("span");
	this.displayIdentifier.innerHTML = this.identifier;
	this.displayTime = document.createElement("span");
	this.displayCheckBox = document.createElement("input");
	this.displayCheckBox.type = "checkbox";
	this.displayCheckBox.value = id;
	this.display.appendChild(this.displayIdentifier);
	this.display.appendChild(document.createElement("br"));
	this.display.appendChild(this.displayTime);
	this.display.appendChild(this.displayCheckBox);

	this.addTime = function(time) {
		this.times.push(time);
		displaySpan = document.createElement("span");
		displaySpan.className = "scheduleDisplay";
		time.setBackgroundColor(this.color);
		displaySpan.innerHTML = department + "-" + number + "-" + section;
		time.display.appendChild(displaySpan);
		time.courseID = this.id;
	};

	for (time in times) {
		this.times.push(times[time]);
		this.addTime(times[time]);
	}
	this.displayTime.innerHTML = prettyTimeList(this.times);

	this.showTimes = function() {
		for (time in this.times) {
			this.times[time].show();
		}
		selectedCourses.push(this.id);
	};
	this.hideTimes = function() {
		for (time in this.times) {
			this.times[time].hide();
		}
		selectedCourses.pop(selectedCourses.indexOf(this.id));
	};

	this.showConflicts = function() {
		for (i in this.times) {
			theseConflicts = findConflicts(this.times[i]);
			for (j in theseConflicts) {
				this.conflicts.push(theseConflicts[j]);
				theseConflicts[j].show();
			}
		}
	};
	this.hideConflicts = function() {
		for (i in this.conflicts) {
			this.conflicts[i].hide();
		}
		this.conflicts = [];
		for (i in selectedCourses) {
			for (j in courses[i].conflicts) {
				if (courses[i].conflicts[j].fatherID == this.id) {
					courses[i].conflicts[j].hide();
					courses[i].conflicts.pop(j);
				}
			}
			
		}
	};
	
	this.displayCheckBox.owner = this;
	this.displayCheckBox.onclick = function() {
		if (this.selected) {
			this.owner.hideTimes();
			this.owner.hideConflicts();
			this.selected = false;
		} else {
			this.owner.showTimes();
			this.owner.showConflicts();
			this.selected = true;
		}
	};

	courseContainer = document.createElement("li");
	courseContainer.appendChild(this.display);
	preferredDiv.appendChild(courseContainer);

}

function conflictWithAny(time) {
	/*
	 * See if this time conflicts with any course. Will return true if this time
	 * conflicts with any of the selected courses.
	 */
	for ( var i = 0; i < selectedCourses.length; i++) {
		var times = selectedCourses[i].times;
		for ( var j = 0; j < times.length; j++)
			if (conflict(time, times[j]))
				return true;
	}
}
function returnConflicts(time) {
	/*
	 * Returns all times which currently conflict with this course.
	 */
	for ( var i = 0; i < selectedCourses.length; i++) {
		var times = selectedCourses[i].times;
		for ( var j = 0; j < times.length; j++)
			if (conflict(time, times[j]))
				return times[j];
	}
}

function courseConflictWithAny(course) {
	/*
	 * Returns true if any time in this course conflicts with a time in any
	 * selected course.
	 */
	var myTimes = course.times;
	for ( var i = 0; i < myTimes.length; i++) {
		if (conflictWithAny(myTimes[i]))
			return true;
		else
			return false;
	}

}

function findConflict(time1, time2) {
	/*
	 * Assumes there already is a conflict and returns the start and end times
	 * of that conflict between the two times
	 */
	var conStart = 0;
	var conEnd = 0;
	if (time2.start <= time1.end && time1.start <= time2.start) {
		conStart = time2.start;
		conEnd = time1.end;
	} else if (time1.start <= time2.end && time2.start <= time1.start) {
		conStart = time1.start;
		conEnd = time2.end;
	}
	return conStart, conEnd;
}