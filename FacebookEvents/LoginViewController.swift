//
//  LoginViewController.swift
//  CandyChallenge
//
//  Created by Simen Johannessen on 17/03/15.
//  Copyright (c) 2015 Simen Lomås Johannessen. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, FBLoginViewDelegate {
    
    @IBOutlet weak var fbLoginView: FBLoginView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email"]
    }
    
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        println("User Logged In")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let listEventViewController: EventsTableViewController = storyboard.instantiateViewControllerWithIdentifier("EventsTableViewController") as! EventsTableViewController
        self.navigationController?.popToViewController(self, animated: false)
        self.navigationController?.pushViewController(listEventViewController, animated: true)
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
        println("User: \(user)")
        println("User ID: \(user.objectID)")
        println("User Name: \(user.name)")
        var userEmail = user.objectForKey("email")as! String
        println("User Email: \(userEmail)")
        loginViewShowingLoggedInUser(nil)
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }
}
