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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if FBSDKAccessToken.currentAccessToken() == nil {
            println("Start login with Facebook Service")
           login()
        }
        else {
            println("Is already signed in. Do something, get data?")
        }
    }
    
    func login() {
        let manger = FBSDKLoginManager()
        let permissions = ["public_profile", "email"]
        
        manger.logInWithReadPermissions(permissions, handler: { (result, error) -> Void in
            if error != nil {
                println("Error, \(error.localizedDescription)")
            }
            if result.isCancelled {
                println("User cancelled \(result)")
            }
            else {
                println("Successfully granted. Do something, get data?")
            }
        })
    }
}

