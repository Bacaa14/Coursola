/* We define the Course and Time objects here, as well as objects for
 * their displays--the <div> tags which will be displayed to the user.
 * 
 * Each time is given an id. For efficient conflict detection, the time
 * ids are kept in two sorted lists--one according to end-times of the
 * time-blocks, and one according to the beginning.
 * 
 * The TimeDisplays are color-coordinated with their corresponding
 * CourseDisplays. Color selection is handled for now by a 
 * colors array, and a nextColor function which cycles through the
 * array.
 * 
 * Positions of the TimeDisplay objects are calculated according to
 * three constants: TOTAL_HEIGHT (total height of the schedule in pixels)
 * BEGIN_TIME, the number of minutes from 12:00 AM of the first minute
 * that should be displayed on the schedule, and END_TIME, the number of
 * minutes from 12:00 of the last minute that should be displayed on the
 * schedule.
 */

MINUTE_HEIGHT = TOTAL_HEIGHT / (END_TIME - BEGIN_TIME);
timeId = 0;
timeMap = {};
timeList = [];
groups = [];

function Group(course1id, course2id) {
	var course1 = courseMap[course1id];
	var course2 = courseMap[course2id];
	course1.group = this;
	course2.group = this;
	course1.deselect();
	course2.deselect();
	this.activeCourse = null;
	this.courses = [];
	this.courses.push(course1);
	this.courses.push(course2);
	this.color = nextColor();
	this.display = new GroupDisplay(this);
	course1.display.addClass("groupedCourseDisplay");
	course2.display.addClass("groupedCourseDisplay");
	course1.display.droppable("disable");
	course2.display.droppable("disable");
	course1.display.off('click');
	course2.display.off('click');
	this.display.insertAfter(course1.display);
	this.display.append(course1.display.detach());
	this.display.append(course2.display.detach());
	
	
	this.removeCourse = function(course) {
		course.group = null;
		course.display.data("group", null);
		this.courses.splice(this.courses.indexOf(course), 1);
		course.display.droppable("enable");
		course.display.on('click', course.display.data('toggleSelect'));
		course.display.removeClass("groupedCourseDisplay");
		course.display.detach().insertAfter(this.display);
		if (this.courses.length == 1) {
			groups.splice(groups.indexOf(this), 1);
			this.removeCourse(this.courses[0]);
			this.display.remove();
		}
	};
	this.findActiveCourse = function() {
		updateConflictedCourses();
		var foundConflictFreeCourse = false;
		for (i in this.courses) {
			if (!this.courses[i].conflictsWithSelected) {
				foundConflictFreeCourse = true;
				this.setActiveCourse(this.courses[i]);
				return true;
			}
		}
		if (foundConflictFreeCourse == false) {
			this.activeCourse = null;
			return false;
		}
	};
	this.setActiveCourse = function(course) {
		this.activeCourse = course;
		for (i in this.courses) {
			this.courses[i].display.removeClass("activeCourseDisplay");
		}
		course.display.addClass("activeCourseDisplay");
	};
	this.findActiveCourse();
	groups.push(this);
}
/*
 * Set the div which contains the course displays to accept grouped courses that
 * you drop somewhere inside.
 */

readyFunction = function() {
	$('#preferred').droppable(
			{
				accept : function(draggable) {
					return courseMap[draggable.data("id")].group != null;
				},
				drop : function(event, ui) {
					courseMap[ui.draggable.data("id")].group
							.removeCourse(courseMap[ui.draggable.data("id")]);
					/*This is a really ugly workaround for a bug that was causing grouping
					 * to fail after any group had been disbanded.
					 */
					$('#preferred').droppable('destroy'); 
					readyFunction();				}
			});
};
$(document).ready(readyFunction);

function GroupDisplay(group) {
	display = $('<div></div>');
	display.data("group", group);
	display.css('background-color', group.color);
	display.css('border-width', 'thick');
	display.css('border-color', group.color);
	display.addClass("groupDisplay");
	display.droppable({
		accept : function(draggable) {
			return courseMap[draggable.data("id")].group == null;
		},
		drop : function(event, ui) {
			ui.draggable.addClass('groupedCourseDisplay');
			courseMap[ui.draggable
						.data("id")].group = $(this).data("group");
			ui.draggable.droppable("disable");
			$(this).append(ui.draggable.detach());
			$(this).data("group").courses.push(courseMap[ui.draggable
					.data("id")]);
			
		}
	});
	group.display = display;

	return display;
}

function Course(id, department, number, section, title, times) {
	this.selected = false;
	this.id = id;
	this.department = department;
	this.number = number;
	this.section = section;
	this.title = title;
	this.identifier = this.department + "-" + this.number + "-" + this.section;
	this.color = nextColor();
	this.times = [];
	this.display = new CourseDisplay(this);
	this.addTime = function(time) {
		time.setCourse(this);
		if (time.day != "Z" && this.times.length == 0) {
			$('#preferred').append(this.display);
		}
		this.times.push(time);
	};
	this.addPrettyTimes = function() {
		this.display
				.append($('<span>' + prettyTimeList(this.times) + '</span>'));
	};
	for (i in times) {
		this.addTime(times[i]);
	}
	this.getConflictsWithSelected = function() {
		var conflicts = [];
		for (i in this.times) {
			var conflictList = this.times[i].getConflictsWithSelected();
			for (j in conflictList) {
				if (conflictList[j] != null) {
					conflicts.push(conflictList[j]);
				}
			}
		}
		return conflicts;
	};
	this.select = function() {
		var conflicts = this.getConflictsWithSelected();
		if (conflicts.length == 0) {
			this.display.addClass('selectedCourseDisplay');
			this.selected = true;
			document.getElementById(this.id).checked = true;
			for (i in this.times) {
				this.times[i].select();
			}
			selectedCourses.push(this);
		}
		updateConflictedCourses();
	};
	this.deselect = function() {
		this.display.removeClass('selectedCourseDisplay');
		this.selected = false;
		document.getElementById(this.id).checked = false;
		for (i in this.times) {
			this.times[i].deselect();
		}
		selectedCourses.pop(selectedCourses.indexOf(this));
		updateConflictedCourses();
	};
	this.disable = function() {
		this.conflictsWithSelected = true;
		this.display.addClass("conflictedCourseDisplay");
	};
	this.enable = function() {
		this.conflictsWithSelected = false;
		this.display.removeClass("conflictedCourseDisplay");
	};
	this.checkForConflicts = function() {
		if (!this.selected) {
			var conflict = false;
			for (i in this.times) {
				if (this.times[i].getConflictsWithSelected().length > 0) {
					conflict = true;
				}
			}
			if (conflict == true) {
				this.disable();
			}
			else {
				this.enable();
			}
		}
	};
}

function CourseDisplay(course) {
	display = $('<div></div>');
	display.data("id", course.id);
	display.css('background-color', course.color);
	display.css('border-color', color);
	display.addClass("courseDisplay");
	display.addClass("unattachedCourseDisplay");
	display.append($('<span>' + course.identifier + '</span><br/>'));
	display.append($('<span>' + course.title + '</span>'));
	display.append($('<br/>'));
	display
			.append($("<input type=\"checkbox\" style=\"visibility:hidden;\" \
		name=\"courses\" id="
					+ course.id + " value=" + course.id + " />"));
	display.draggable({
		revert : true,
		axis : 'y',
		stack : '.courseDisplay',
	});
	display.droppable({
		hoverClass : 'hungryCourseDisplay',
		accept : function(draggable) {
			return courseMap[draggable.data("id")].group == null;
		},
		drop : function(event, ui) {
			
			group = new Group(ui.draggable
					.data("id"), $(this).data("id"));
		}

	});
	display.data("toggleSelect", function() {
		if (course.selected) {
			course.deselect();
		} else {
			course.select();
		}
	}); 
	display.on("click", display.data("toggleSelect"));
	display.on("mouseenter", function() {
		if (!course.selected) {
			for (i in course.times) {
				course.times[i].display.stop(true, true).fadeIn('fast');
			}
			course.conflicts = course.getConflictsWithSelected();
			for (i in course.conflicts) {
				course.conflicts[i].display.stop(true, true).fadeIn('fast');
			}
		}
	});
	display.on("mouseleave", function() {
		if (!course.selected) {
			for (i in course.times) {
				course.times[i].display.stop(true, true).fadeOut('fast');
			}
			for (i in course.conflicts) {
				course.conflicts[i].display.stop(true, true).fadeOut('fast');
			}
			course.conflicts = [];

		}
	});

	course.display = display;
	return display;
}

function updateConflictedCourses() {
	var displayedCourses = $('.courseDisplay');
	displayedCourses.each(function(i) {
		courseMap[$(displayedCourses[i]).data("id")].checkForConflicts();
	});
}

function updateActiveCourses() {
	
}



function Time(day, start, end, course) {
	/* Time object. */
	this.id = nextTimeId();
	timeMap[this.id] = this;
	timeList.push(this.id);
	this.day = day;
	this.start = start;
	this.end = end;
	this.display = new TimeDisplay(this);
	this.deselect = function() {
		this.display.stop().fadeOut('fast');
	};
	this.select = function() {
		this.display.stop().fadeIn('fast');
	};
	this.pretty = prettyTime(start) + "-" + prettyTime(end);
	this.endsBefore = function(time) {
		return this.end < time.start;
	};
	this.startsBefore = function(time) {
		return this.start < time.start;
	};
	this.conflictsWith = function(time) {
		if (time.day != this.day) {
			return false;
		}
		if (time.start < this.start && time.end < this.start) {
			return false;
		}
		if (this.start < time.start && this.end < time.start) {
			return false;
		}
		return true;

	};
	this.setCourse = function(course) {
		this.course = course;
		this.display.css('background-color', course.color);
		this.display.append(display.append("<span>" + course.identifier
				+ "</span>"));
	};
	this.getConflictsWithSelected = function() {
		var conflicts = [];
		for (i in selectedCourses) {
			var course = selectedCourses[i];
			for (j in course.times) {
				var conflict = new Conflict(this, course.times[j]);
				if (!conflict.invalid) {
					conflicts.push(conflict);
				}
			}
		}
		return conflicts;
	};
}

function TimeDisplay(time) {
	display = $('<div/>');
	display.css('position', 'absolute');
	display.css('top', (time.start - BEGIN_TIME) * MINUTE_HEIGHT + 'px');
	display.css('height', (time.end - time.start) * MINUTE_HEIGHT + 'px');
	display.addClass('timeDisplay');
	dayDiv[time.day].append(display);
	time.display = display;
	time.display.css("display", "none");
	return display;
}

function Conflict(time1, time2) {
	if (!time1.conflictsWith(time2)) {
		this.invalid = true;
		return null;
	}
	this.invalid = false;
	this.start = Math.max(time1.start, time2.start);
	this.end = Math.min(time1.end, time2.end);
	this.day = time1.day;
	this.display = new ConflictDisplay(this);
	return this;
}
function ConflictDisplay(conflict) {
	display = $('<div/>');
	display.css('top', (conflict.start - BEGIN_TIME) * MINUTE_HEIGHT + 'px');
	display.css('height', (conflict.end - conflict.start) * MINUTE_HEIGHT
			+ 'px');
	display.css('display', 'none');
	display.addClass('conflict');
	dayDiv[conflict.day].append(display);
	conflict.display = display;
	return display;
}

function nextTimeId() {
	timeId++;
	return timeId;
}

var colors = [ 'blue', 'red', 'green', 'purple', 'orange', 'yellow' ];
var colorindex = 0;
function nextColor() {
	color = colors[colorindex % colors.length];
	colorindex += 1;
	return color;
}


function prettyTime(time) {
	hour = Math.floor(time / 60);
	minute = time % 60;
	if (hour < 12) {
		meridian = "am";
	} else {
		hour %= 12;
		meridian = "pm";
	}
	if (hour == 0) {
		hour = 12;
	}
	if (minute < 10) {
		minute = "0" + minute;
	}
	return hour + ":" + minute + meridian;

}
function prettyTimeList(times) {
	/*
	 * Takes a list of timeBlocks and turns it into a prettified string
	 * representation. Really clunky. Almost certainly a better way to do this
	 * exists.
	 */
	blocks = [];
	ret = "";
	for (i in times) {
		found = false;
		for (j in blocks) {
			if (blocks[j][0][0] == times[i].start
					&& blocks[j][0][1] == times[i].end) {
				blocks[j][1][times[i].day] = times[i].day;
				found = true;
			}
			break;
		}
		if (found == false) {
			entry = [ [ times[i].start, times[i].end ], {
				"M" : "",
				"T" : "",
				"W" : "",
				"R" : "",
				"F" : ""
			} ];
			entry[1][times[i].day] = times[i].day;
			blocks.push(entry);

		}
	}
	for (i in blocks) {
		ret += "<span class = 'daylist'>";
		ret += blocks[i][1]["M"];
		ret += blocks[i][1]["T"];
		ret += blocks[i][1]["W"];
		ret += blocks[i][1]["R"];
		ret += blocks[i][1]["F"];
		ret += "</span> ";
		ret += prettyTime(blocks[i][0][0]);
		ret += "-";
		ret += prettyTime(blocks[i][0][1]);
		if (i != blocks.length) {
			ret += "<br/>";
		}
	}
	return ret;
}