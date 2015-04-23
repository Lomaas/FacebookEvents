//
//  ViewController.swift
//  FacebookEvents
//
//  Created by Simen Johannessen on 21/04/15.
//  Copyright (c) 2015 Bekk. All rights reserved.
//

import UIKit

class EventsTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if FBSDKAccessToken.currentAccessToken() == nil {
            println("Start login with Facebook Service")

            LoginWithFacebookService.login({ () -> Void in
                // Fetch events here
            }, errorHandler: { (error) -> Void in
                // Display error for user
            })
        }
        else {
            println("Is already signed in")
        }
    }
}

