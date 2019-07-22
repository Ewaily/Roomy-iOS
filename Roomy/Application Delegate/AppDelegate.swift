//
//  AppDelegate.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/9/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let def = UserDefaults.standard
        if let auth_token = def.object(forKey: "auth_token") as? String {
            let tab = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Rooms")
            window?.rootViewController = tab
        }
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {}
    
    func applicationDidEnterBackground(_ application: UIApplication) {}
    
    func applicationWillEnterForeground(_ application: UIApplication) {}
    
    func applicationDidBecomeActive(_ application: UIApplication) {}
    
    func applicationWillTerminate(_ application: UIApplication) {}
}

