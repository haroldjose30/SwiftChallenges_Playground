

/*
 Most Free Time
 Have the function MostFreeTime(strArr) read the strArr parameter being passed which will represent a full day and will be
 filled with events that span from time X to time Y in the day. The format of each event will be hh:mmAM/PM-hh:mmAM/PM.
 For example, strArr may be ["10:00AM-12:30PM","02:00PM-02:45PM","09:10AM-09:50AM"]. Your program will have to output the
 longest amount of free time available between the start of your first event and the end of your last event in the
 format: hh:mm. The start event should be the earliest event in the day and the latest event should be the latest event in the day.
 The output for the previous input would therefore be 01:30 (with the earliest event in the day starting at 09:10AM and the latest
 event ending at 02:45PM). The input will contain at least 3 events and the events may be out of order.
 Examples
 Input: ["12:15PM-02:00PM","09:00AM-10:00AM","10:30AM-12:00PM"]
 Output: 00:30
 Input: ["12:15PM-02:00PM","09:00AM-12:11PM","02:02PM-04:00PM"]
 Output: 00:04
 
 // keep this function call here
 //print(MostFreeTime(["12:15PM-02:00PM","09:00AM-10:00AM","10:30AM-11:00AM"]));
 */


import Foundation

public class MostFreeTime {
    
    func MostFreeTime(_ strArr: [String]) -> String {
        
        //convert input to date and time to Event data struct
        let events: [Event] = strArr.compactMap { eventTimes in
            
            mapTimesToEvent(eventTimes)
        }//order times
            .sorted { firstEvent, nextEvent in
                
                firstEvent.start < nextEvent.start
            }
        
        
        
        //verify all free time and store the most one
        var mostFreeTime:TimeInterval?
        var lastEvent: Event?
        for currentEvent in events {
            
            guard let lastEventUnwrapped = lastEvent else {
                lastEvent = currentEvent
                continue
            }
            
            //calculate time in seconds beetween end of firstItem and start of next item
            let timeInterval: TimeInterval = currentEvent.start.timeIntervalSince(lastEventUnwrapped.end)
            
            if mostFreeTime ?? 0 < timeInterval {
                
                mostFreeTime = timeInterval
            }
            
            lastEvent = currentEvent
        }
        
        return formatTimeIntervalToHour(mostFreeTime)
    }
    
    private func mapTimesToEvent(_ eventTimes: String) -> Event? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mma"
        
        let times = eventTimes.split(separator: "-")
        
        guard
            times.count == 2,
            let startDate = dateFormatter.date(from: String(times[0])),
            let endDate = dateFormatter.date(from: String(times[1]))
        else {
            return nil
        }
        
        return Event(
            start: startDate,
            end: endDate
        )
    }
    
    private func formatTimeIntervalToHour(_ interval: TimeInterval?) -> String {
        
        guard let interval = interval else {
            return ""
        }
        
        let hour = Int(interval) / 3600
        let minute = Int(interval) / 60 % 60
        
        // return formated string
        return String(format: "%02i:%02i", hour, minute)
    }
    
    
    private struct Event {
        let start: Date
        let end: Date
    }
    
}
