//
//  Event.swift
//
//  Created by Simen Johannessen on 17/03/15.
//  Copyright (c) 2015 Simen Lomås Johannessen. All rights reserved.
//

import Foundation

class Event {
    let eventDescription: String
    let title: String
    let location: String
    let startTime: String
    let eventId: String
    let myStatus: String
    
    init(description: String, title: String, location: String, startTime: String, eventId: String, myStatus: String) {
        self.eventDescription = description
        self.title = title
        self.location = location
        self.startTime = startTime
        self.eventId = eventId
        self.myStatus = myStatus
    }
}