//
//  clicks2compareApp.swift
//  clicks2compare
//
//  Created by Nitin Singh on 27/11/23.
//

import SwiftUI
import OneSignalFramework




@main
struct clicks2compareApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(appDelegate)
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    @Published var notificationTapped = false
    @Published var index: Int = 0
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
       // Remove this method to stop OneSignal Debugging
       OneSignal.Debug.setLogLevel(.LL_VERBOSE)
        
       // OneSignal initialization
       OneSignal.initialize("6f0fc766-e32b-4113-a513-08e17aefdedf", withLaunchOptions: launchOptions)

       // requestPermission will show the native iOS notification permission prompt.
       // We recommend removing the following code and instead using an In-App Message to prompt for notification permission
       OneSignal.Notifications.requestPermission({ accepted in
         print("User accepted notifications: \(accepted)")
       }, fallbackToSettings: true)

       // Login your customer with externalId
       // OneSignal.login("EXTERNAL_ID")
        
            
       return true
    }
}


extension AppDelegate: UNUserNotificationCenterDelegate{
    
  // This function will be called right after user tap on the notification
  func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
      self.notificationTapped = true
      self.index = 2
    // tell the app that we have finished processing the user’s action / response
    completionHandler()
  }
}

