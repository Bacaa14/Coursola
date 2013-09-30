import sys
import getopt
import urllib.request
from bs4 import BeautifulSoup
import re

pattern = re.compile("[a-z][A-Z]")

def getTimes(datestring, courseid):
    #Returns list of one or time slots
    match = pattern.search(datestring)
    if match:
        firstdate = datestring[0:match.start()+1]
        seconddate = datestring[match.end()-1:]
        print(formatDate(firstdate, courseid))
        print(formatDate(seconddate, courseid))
    else:
        print(formatDate(datestring, courseid))

def formatDate(datestring, courseid):
    #returns time slot: list containing all days/start time/end time
    if datestring == "ARR":
        return str(courseid) + ",Z,-1,-1"
    datetime = datestring.split(' ')
    days = list(datetime[0])
    times = datetime[1].split('-')
    start = getMinutes(times[0])
    end = getMinutes(times[1])
    return '\n'.join(['%s,%s,%d,%d' % (courseid, day, start, end) for day in days])


def getMinutes(time):
    m = time[-1]
    (hours, minutes) = time[:-1].split(':')
    minutes = int(minutes)
    if (hours != '12'):
        minutes += int(hours)*60
    if(m == 'p'):
        minutes += 720  #adding minutes from midnight to noon
    return minutes


soup = BeautifulSoup(open("courseofferings.html"))
rows = soup.find(id='ctl00_AppContent_CoGridView').findAll('tr')
heads = rows[0].findAll('th')
table = [row.findAll('td') for row in rows[1:]]

##for head in heads:
##    print(head.string, end="~")
##print()

dateStrings = []
for i, row in enumerate(table):
    pass
##    print(i, end="~")
    for j, cell in enumerate(row):
        if j == 0:
            pass
##          print("~".join(cell.string.split("-")), end = "~")
        elif j == 6:
            if ("".join(cell.stripped_strings) == "N"):
                pass
##                print(0, end = "~")
            else:
                pass
##                print(1, end = "~")
        elif j == 8:
            pass
            dateStrings.append("".join(cell.stripped_strings))
        elif j == 10:
            pass
        elif j == 9:
            pass
##            print("".join(cell.stripped_strings))
        else:
            pass
##            print("".join(cell.stripped_strings), end="~")
            

for courseid, datestring in enumerate(dateStrings):
    getTimes(datestring, courseid)


