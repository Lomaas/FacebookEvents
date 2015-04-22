//
//  ViewController.swift
//  FacebookEvents
//
//  Created by Simen Johannessen on 21/04/15.
//  Copyright (c) 2015 Bekk. All rights reserved.
//

import UIKit

class EventTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if FBSDKAccessToken.currentAccessToken() == nil {
            println(" start login up")
            self.login()
        }
        else {
            println(" fetch events")
            
            fetchEvents()
//            EventService.fetchEvent("415432738605686", successHandler: { (event, venue) -> Void in
//                
//            }, errorHandler: { (error) -> Void in
//                
//            })
        }
    }
    
    private func fetchEvents() {
        EventService.fetchEvents(successHandler: { (events) -> Void in
            println("success")
            }) { (error) -> Void in
                println("error")
        }
    }
    
    private func login() {
        let manger = FBSDKLoginManager()
        let permissions = ["public_profile", "email"]
        
        manger.logInWithReadPermissions(permissions, handler: { (result, error) -> Void in
            if error != nil {
                println("error")
            }
            if result.isCancelled {
                println("User cancelled \(result)")
            }
            else {
                println("Success ful granted")
                self.fetchEvents()
            }
        })
    }
}

