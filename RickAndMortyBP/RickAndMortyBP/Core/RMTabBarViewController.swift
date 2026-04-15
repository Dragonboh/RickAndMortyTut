//
//  RMTabBarViewController.swift
//  RickAndMortyBP
//
//  Created by Bogdan Pankevych on 01.02.2026.
//

import UIKit

final class RMTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .systemBackground
        
        setUpViewControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Tab Bar viewWillAppear")
    }
    
    private func setUpViewControllers() {
        let vc1 = CharactersViewController()
//        vc1.title = "VC--1"
        let vc2 = CharactersViewController()
//        vc2.title = "VC--2"
        let vc3 = CharactersViewController()
        let vc4 = CharactersViewController()
        
       
        
        let nav1 = CustomNavigationController(rootViewController: vc1)
//        nav1.tabBarItem.title = "VC1-NAV-TAB"
        let nav2 = CustomNavigationController(rootViewController: vc2)
        let nav3 = CustomNavigationController(rootViewController: vc3)
        let nav4 = CustomNavigationController(rootViewController: vc4)
        
        nav1.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName:"person"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName:"globe"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName:"tv"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName:"gear"), tag: 4)
        
        for nav in [nav1, nav2, nav3, nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
        
        print("setUpViewControllers -- vc1.title -- \(String(describing: vc1.title))")
        print("setUpViewControllers -- vc1.tabBarItem.title -- \(String(describing: vc1.tabBarItem.title))")
        print("setUpViewControllers -- vc1.navigationController?.title -- \(String(describing: vc1.navigationController?.title))")
        print("setUpViewControllers -- vc1.navigationController?.tabBarItem.title -- \(String(describing: vc1.navigationController?.tabBarItem.title))")
        print("setUpViewControllers -- END")
//        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
}

class CustomNavigationController: UINavigationController {

    // MARK: - Properties

    private var titleObservation: NSKeyValueObservation?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitleObserver()
    }

    deinit {
        titleObservation?.invalidate()
    }

    // MARK: - Title Observer

    private func setupTitleObserver() {
        titleObservation = observe(\.title, options: [.new, .old]) { [weak self] _, change in
            guard let self = self else { return }
            let oldTitle = change.oldValue ?? nil
            let newTitle = change.newValue ?? nil
            print("Navigation title changed: \"\(oldTitle ?? "nil")\" → \"\(newTitle ?? "nil")\"")
//            self.titleDidChange(from: oldTitle, to: newTitle)
        }
    }

}

