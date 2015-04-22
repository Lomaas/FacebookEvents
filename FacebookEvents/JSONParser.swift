//
//  JSONParser.swift
//
//  Created by Simen Johannessen on 24/03/15.
//  Copyright (c) 2015 Simen Lomås Johannessen. All rights reserved.
//

import Foundation

extension String {
    var doubleValue: Double {
        if let number = NSNumberFormatter().numberFromString(self) {
            return number.doubleValue
        }
        return 0
    }
}

struct JSONParser {
    static func parseVenue(venue: NSDictionary) -> Venue {
        let latitude = venue["latitude"] as? Double ?? 0
        let longitude = venue["longitude"] as? Double ?? 0
        let city = venue["city"] as? String ?? ""
        return Venue(city: city, latitude: latitude, longitude: longitude)
    }
    
    static func parseEvent(event: NSDictionary) -> Event {
        let name = event["name"] as? String ?? ""
        let status = event["rsvp_status"] as? String ?? ""
        let location = event["location"] as? String ?? ""
        let eventId = event["id"] as? String ?? ""
        let startTime = event["start_time"] as? String ?? ""
        
        return Event(description: "", title: name, location: location, startTime: startTime, eventId: eventId, myStatus: status)
    }
    
    
    // TASK - implementer denne ferdig
    static func parseEventDetails(eventDetails: [NSObject: AnyObject]) -> EventDetails {
        return EventDetails(eventId: "test")
    }
}
