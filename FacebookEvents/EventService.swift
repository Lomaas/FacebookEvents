//
//  EventService.swift
//
//  Created by Simen Johannessen on 16/04/15.
//  Copyright (c) 2015 Simen Lomås Johannessen. All rights reserved.
//

import Foundation

struct EventService {
    static func fetchEvents(q: String, successHandler: (events: Array<Event>) -> Void, errorHandler: (error: NSError) -> Void) {
        var completionHandler = { connection, result, error in
            println("Completion handler \(result)")
            
            if error != nil {
                println("FailedFetchEvent \(error)")
                errorHandler(error: error)
            }
            else {
                var events = Array<Event>()
                
                for event in result?.data as! [FBGraphObject] {
                    println("Res: \(event)")
                    let newEvent = JSONParser.parseEvent(event)
                    events.append(newEvent)
                }
                
                events.reverse()
                successHandler(events: events)
            }
            } as FBRequestHandler;
        
        let query = q == "" ? "oslo" : q
        
        FBRequestConnection.startWithGraphPath(
            "/search?q=" + query + "&type=event",
            completionHandler: completionHandler
        );
    }
    
    static func fetchEvent(eventId: String,  successHandler: (event: Event, venue: Venue?) -> Void, errorHandler: (error: NSError) -> Void) {
        var completionHandler = { connection, result, error in
            println("Completion handler \(result)")
            
            if error != nil {
                println("FailedFetchEvent \(error)")
                errorHandler(error: error)
            }
            else {
                let eventDetails = JSONParser.parseEvent(result as! NSDictionary)
                var venue: Venue?
                
                if let jsonVenue = result["venue"] as? NSDictionary {
                    venue = JSONParser.parseVenue(jsonVenue)
                }
                
                successHandler(event: eventDetails, venue: venue)
            }
            
            } as FBRequestHandler
        
        println("EventID: \(eventId)")
        
        FBRequestConnection.startWithGraphPath(
            "/" + eventId,
            completionHandler: completionHandler
        );
    }
    
}