//
//  EventService.swift
//
//  Created by Simen Johannessen on 16/04/15.
//  Copyright (c) 2015 Simen Lomås Johannessen. All rights reserved.
//

import Foundation

struct EventService {
    static func fetchEvents(query: String = "Oslo", successHandler: (events: Array<Event>) -> Void, errorHandler: (error: NSError) -> Void) {
        let request = FBSDKGraphRequest(graphPath: "/search?q=\(query)&type=event", parameters: nil)
        request.startWithCompletionHandler { (connection, result, error) -> Void in
            println("Completion handler \(result)")
            
            if error != nil {
                println("FailedFetchEvent \(error)")
                errorHandler(error: error)
            }
            else {
                var events = Array<Event>() // Population array
                let data = result?.objectForKey("data") as! NSArray
                
                for i in 0...data.count - 1 {
                    let valueDict : NSDictionary = data[i] as! NSDictionary
                    println("Res: \(valueDict)")
                    let newEvent = JSONParser.parseEvent(valueDict)
                    events.append(newEvent)
                }
                
                successHandler(events: events)
            }
        }
    }

    static func fetchEvent(eventId: String,  successHandler: (event: Event, venue: Venue?) -> Void, errorHandler: (error: NSError) -> Void) {
        println("EventID: \(eventId)")
        let request = FBSDKGraphRequest(graphPath: "/\(eventId)", parameters: nil)
        request.startWithCompletionHandler { (connection, result, error) -> Void in
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
        }
    }
    
}