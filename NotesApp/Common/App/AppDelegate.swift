//
//  AppDelegate.swift
//  NotesApp
//
//  Created by Анна Вертикова on 11.03.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: UISceneSession Lifecycle

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let homeModule = HomeBuilder.createModule()
        let navigationController = UINavigationController()
        navigationController.viewControllers = [homeModule]
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        CoreDataManager.sharedManager.saveContext()
    }

}

