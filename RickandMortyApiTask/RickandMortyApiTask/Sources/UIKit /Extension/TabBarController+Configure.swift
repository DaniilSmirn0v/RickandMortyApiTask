//
//  TabBarController+Configure.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 27.11.22.
//

import UIKit

extension UITabBarController {

    func setup(assembly: AssemblyBuilderProtocol) -> UITabBarController {

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

       self.viewControllers = [navCharactersViewController, navLocationListViewController, navEpisodeListViewController]

        return self
    }

}

