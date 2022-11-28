//
//  AppDelegate.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 22.11.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let assembly = AssemblerBuilder()
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        let tabBarController = UITabBarController()
            .setup(assembly: assembly)
        tabBarController.tabBar.tintColor = .systemOrange
        
        window?.overrideUserInterfaceStyle = .dark
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }

}

