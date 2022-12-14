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
        tabBarController.tabBar.tintColor = .systemOrange
        tabBarController.tabBar.backgroundColor = .black.withAlphaComponent(0.5)

        let charactersViewController = assembly.configureCharactersListModule()

        charactersViewController.tabBarItem.image = UIImage(systemName: "person.3.fill")
        charactersViewController.tabBarItem.title = "Characters"
        let navCharactersViewController = UINavigationController(rootViewController: charactersViewController)
        navCharactersViewController.navigationBar.prefersLargeTitles = true
        navCharactersViewController.navigationBar.isTranslucent = false
        navCharactersViewController.navigationBar.tintColor = .systemOrange

        let episodeListViewController = assembly.configureEpisodeListModule()
        episodeListViewController.tabBarItem.image = UIImage(systemName: "tv.fill")
        episodeListViewController.tabBarItem.title = "Episodes"
        let navEpisodeListViewController = UINavigationController(rootViewController: episodeListViewController)
        navEpisodeListViewController.navigationBar.prefersLargeTitles = true
        navEpisodeListViewController.navigationBar.isTranslucent = false
        navEpisodeListViewController.navigationBar.tintColor = .systemOrange

        let locationListViewController = LocationListViewController()
        locationListViewController.tabBarItem.image = UIImage(systemName: "map.fill")
        locationListViewController.tabBarItem.title = "Locations"
        let navLocationListViewController = UINavigationController(rootViewController: locationListViewController)
        navLocationListViewController.navigationBar.prefersLargeTitles = true
        navLocationListViewController.navigationBar.isTranslucent = false
        navLocationListViewController.navigationBar.tintColor = .systemOrange

        tabBarController.viewControllers = [navCharactersViewController, navLocationListViewController, navEpisodeListViewController]
        tabBarController.selectedViewController = navCharactersViewController

        window?.overrideUserInterfaceStyle = .dark
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }

}

