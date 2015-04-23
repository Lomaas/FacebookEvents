//
//  LoginWithFacebookSerice.swift
//  FacebookEvents
//
//  Created by Simen Johannessen on 23/04/15.
//  Copyright (c) 2015 Bekk. All rights reserved.
//

import Foundation


struct LoginWithFacebookService {
    static func login(successHandler: () -> Void, errorHandler: (error: NSError) -> Void) {
        let manger = FBSDKLoginManager()
        let permissions = ["public_profile", "email"]
        
        manger.logInWithReadPermissions(permissions, handler: { (result, error) -> Void in
            if error != nil {
                println("Error")
                errorHandler(error: error)
            }
            if result.isCancelled {
                println("User cancelled \(result)")
                errorHandler(error: error)
            }
            else {
                println("Successfully granted")
                successHandler()
            }
        })
    }
}