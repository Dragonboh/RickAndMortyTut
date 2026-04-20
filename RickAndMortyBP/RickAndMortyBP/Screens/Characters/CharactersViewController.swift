//
//  CharactersViewController.swift
//  RickAndMortyBP
//
//  Created by admin on 08.02.2026.
//

import UIKit


final class CharactersViewController: UIViewController {
    
    private let characterView = CharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTitle("Characters-VC")
        navigationItem.largeTitleDisplayMode = .automatic
//        navigationItem.title = "BLA BLA BLA"
        
        print("setUpViewControllers -- self.title -- \(String(describing: self.title))")
        print("setUpViewControllers -- self.tabBarItem.title -- \(String(describing: self.tabBarItem.title))")
        print("setUpViewControllers -- self.navigationController?.title -- \(String(describing: self.navigationController?.title))")
        print("setUpViewControllers -- self.navigationController?.tabBarItem.title -- \(String(describing: self.navigationController?.tabBarItem.title))")
//        navigationController?.tabBarItem.title = "OK OK OK"
        
        view.backgroundColor = .systemBackground
        
        
//        print(request.url)
        
        view.addSubview(characterView)
        
        NSLayoutConstraint.activate([
            characterView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            characterView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            characterView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View Will Appear")
        tabBarItem.title = "KO KO KO"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setTitle(_ title:String) {
        let tabBarTitle = navigationController?.tabBarItem.title
        self.title = title
        navigationController?.tabBarItem.title = tabBarTitle
    }
}

final class CharactersViewController2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Characters--2"
        
        view.backgroundColor = .green
        navigationController?.viewControllers.first?.title = "NEW-ROOT-TITLE"
//        navigationItem.largeTitleDisplayMode = .automatic
//        navigationItem.title = "BLA BLA BLA"
//        tabBarItem.title = "KO KO KO"
//        navigationController?.title = "NEW-NAV-TITLE"
//        
//        print("setUpViewControllers -- self.title -- \(String(describing: self.title))")
//        print("setUpViewControllers -- self.tabBarItem.title -- \(String(describing: self.tabBarItem.title))")
//        print("setUpViewControllers -- self.navigationController?.title -- \(String(describing: self.navigationController?.title))")
//        print("setUpViewControllers -- self.navigationController?.tabBarItem.title -- \(String(describing: self.navigationController?.tabBarItem.title))")
////        navigationController?.tabBarItem.title = "OK OK OK"
//        
//        view.backgroundColor = .blue
    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        print("View Will Appear")
//        tabBarItem.title = "KO KO KO"
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        <#code#>
//    }
}
