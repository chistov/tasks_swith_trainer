//
//  HomeCtrl.swift
//  Tasks Switcher Trainer
//
//  Created by chistov on 11.06.2020.
//  Copyright © 2020 Sergey Chistov. All rights reserved.
//


import UIKit

class HomeCtrl: UIViewController {
    
    var delegate: HomeCtrlDelegate?  // sort of link between controllers
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureNavigationBar()
    }
    
    @objc func handleMenuToggle(){
        delegate?.handleMenuToggle(forMenuOption: nil)
        print("Toggle Menu")
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Side Menu"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "hamburger").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
}
