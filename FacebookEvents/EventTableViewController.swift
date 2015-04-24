//
//  ViewController.swift
//  FacebookEvents
//
//  Created by Simen Johannessen on 21/04/15.
//  Copyright (c) 2015 Bekk. All rights reserved.
//

import UIKit

class EventsTableViewController: UIViewController {
    let eventsMock = [
        (title: "Salg på Komplett.no", eventDescription: "Crazy Weekend på Komplett.no med helt sinnsyke priser!"),
        (title: "Tom Waits-løpet 2015", eventDescription: "Hvert år møter over tusen forventningsfulle osloborgere opp i Middelalderparken for å delta på Norges største pub-crawl «Tom Waits-løpet»"),
        (title: "Oslo Karneval 2015", eventDescription: "Oslo Karneval holdes 6. juni, i samarbeid med Musikkfest Oslo!")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

