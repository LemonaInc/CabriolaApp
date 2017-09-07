//
//  AppDelegate.swift
//  TableViewsAssignment
//
//  Created by Jaxon Stevens on 8/16/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import UIKit
import UserNotifications
import FacebookCore
import FBNotifications
import FBSDKLoginKit



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    // DID FINISH LAUNCHING
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
      
        
        if launchOptions != nil {
            if let userInfo = launchOptions![UIApplicationLaunchOptionsKey.remoteNotification] as? NSDictionary {
                //Capture notification data e.g. badge, alert and sound
                if let aps = userInfo["aps"] as? NSDictionary {
                    let alert = aps["alert"] as! String
                    print("Notification message: ", alert);
                    //UIAlertView(title:"Push Notification!", message:alert, delegate:nil, cancelButtonTitle:"OK").show()
                }
                
                //Capture custom fields
                if let articleId = userInfo["articleId"] as? NSString {
                    print("ArticleId: ", articleId);
                }
            }
        }
        
        //
        
        // Override point for customization after application launch.
        UIApplication.shared.registerForRemoteNotifications()
        
        let settings = UIUserNotificationSettings(types: [.alert], categories: nil)
        UIApplication.shared.registerUserNotificationSettings(settings)
    
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in
            // Enable or disable features based on authorization.
        }
        application.registerForRemoteNotifications()
        
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        return true
        
    }
    
    
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
      // Pushbots.sharedInstance().register(onPushbots: deviceToken);

        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        print("TOKEN \(deviceTokenString)")
        
        
        return
        
    
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
        print("No Token \(error)")
        
        return
        
    }
    
    
    @nonobjc func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        FBNotificationsManager.shared().presentPushCard(forRemoteNotificationPayload: userInfo, from: nil) { viewController, error in
            if error != nil {
                completionHandler(.failed)
            } 
            else {
                completionHandler(.newData)
            }
        }
        return
        
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        FBSDKAppEvents.activateApp()
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
         AppEventsLogger.activate(application)
        return
       
        
    }
    

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.

    }

    

    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
        return true
    }
    

}



