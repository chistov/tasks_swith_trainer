//
//  ContainerCtrl.swift
//  Tasks Switcher Trainer
//
//  Created by chistov on 11.06.2020.
//  Copyright © 2020 Sergey Chistov. All rights reserved.
//

import UIKit

class ContainerCtrl: UIViewController {
    
    var menuCtrl: MenuCtrl!
    var centerCtrl: UIViewController!
    var isExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeCtrl()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
//    override var preferredSst: UIStatusBarAnimation {
//        return .slide
//    }
    
//    override var preferredStatusBarHidden: Bool {
//        return isExpanded
//    }
    
    func configureHomeCtrl(){
        let homeCtrl = HomeCtrl()
        homeCtrl.delegate =  self
        centerCtrl = UINavigationController(rootViewController: homeCtrl)
        
        view.addSubview(centerCtrl.view)
        addChild(centerCtrl)
        centerCtrl.didMove(toParent: self)
    }
    
    func configureMenuCtrl(){
        if menuCtrl == nil {
            menuCtrl = MenuCtrl()
            menuCtrl.delegate = self
            view.insertSubview(menuCtrl.view, at: 0)
            addChild(menuCtrl)
            menuCtrl.didMove(toParent: self)
            print("Did add menuCtrl. ...")
        }
    }
    
    func animatePanel(shouldExpand: Bool, menuOption: MenuOption?){
        if shouldExpand {
            // show menu
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                self.centerCtrl.view.frame.origin.x = self.centerCtrl.view.frame.width - 80
            }, completion: nil)
        } else {
            // hide menu
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerCtrl.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)  // calls only after animation
            }
            
        }
        
        animateStatusBar()
    }
    
    func didSelectMenuOption(menuOption: MenuOption){
        switch menuOption {
        case .Math:
            let ctrl = MathCtrl()
            ctrl.param = "This is param!"
            
            present(UINavigationController(rootViewController: ctrl), animated: true, completion: nil)
//            present(ctrl, animated: true, completion: nil)
        case .Shulte:
            print("Show shulte")
        case .Text:
            print("Show profile")
        }
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
    
}

extension ContainerCtrl: HomeCtrlDelegate {
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        if !isExpanded {
           configureMenuCtrl()
        }
           
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
    }
}
