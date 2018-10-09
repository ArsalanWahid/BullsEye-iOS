//
//  AppDelegate.swift
//  bulls-eye
//
//  Created by Arsalan Wahid Asghar on 11/3/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    //One time setup tasks
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    
    //Validate data start network tasks so on
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    
    //Foreground part of the
    
    func applicationDidBecomeActive(_ application: UIApplication) {

    }
    
    //This is the inactive part and maybe app is going to background
    func applicationWillResignActive(_ application: UIApplication) {

    }

    //This is the Background part
    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    //Application is coming from background to foreground
    func applicationWillEnterForeground(_ application: UIApplication) {

    }

   
    //Application is about to terminate or is suspended
    func applicationWillTerminate(_ application: UIApplication) {
       
    }


}

