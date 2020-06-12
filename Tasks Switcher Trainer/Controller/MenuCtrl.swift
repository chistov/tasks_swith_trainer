//
//  MenuCtrl.swift
//  Tasks Switcher Trainer
//
//  Created by chistov on 11.06.2020.
//  Copyright © 2020 Sergey Chistov. All rights reserved.
//


import UIKit

private let reuseIdentifier = "MenuOptionCell"

class MenuCtrl: UIViewController {
    
    var tableView: UITableView!
    var delegate: HomeCtrlDelegate? // click on left menu
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.backgroundColor = .darkGray
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
    }
    
    func didSelectMenuOption(menuOption: MenuOption){
        switch menuOption {
            case .Math:
                print("Show Math")
                break
            case .Shulte:
                print("Show Shulte")
                break
            case .Text:
                print("Show Text")
        }
    }
    
}

extension MenuCtrl: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MenuOptionCell
        
        // Choose menu option from the left
        let menuOption = MenuOption(rawValue: indexPath.row)
        cell.descriptionLable.text = menuOption?.description
        cell.iconImgView.image = menuOption?.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // click option processing
        let menuOption = MenuOption(rawValue: indexPath.row)
        delegate?.handleMenuToggle(forMenuOption: menuOption)
    }
    
}
