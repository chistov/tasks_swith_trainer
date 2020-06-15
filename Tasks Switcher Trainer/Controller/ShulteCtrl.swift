//
//  ShulteCtrl.swift
//  Tasks Switcher Trainer
//
//  Created by chistov on 15.06.2020.
//  Copyright © 2020 Sergey Chistov. All rights reserved.
//

import UIKit
import SwiftUI

class ShulteCtrl: UIViewController {
    
    var param: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .darkGray
        navigationItem.title = "Shulte"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "close_cross").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
        
        content()
        
        if let param = param {
            print("param: \(param)")
        }
    }
    
    @objc func handleDismiss(){
        dismiss(animated: true, completion: nil)
    }
    
    func content(){
//        let imageName = "tab1.png"
//        let image = UIImage(named: imageName)
//        let imageView = UIImageView(image: image!)
//
//        imageView.frame = CGRect(x: 50, y: 250, width: 500, height: 500)
//        view.addSubview(imageView)
        
        struct ContentView : View {
            @State private var next = 1
            @State private var image = Image("tab1")
            @State private var screenSize: CGRect = UIScreen.main.bounds
            
            var body: some View {
                
                VStack(alignment: .leading) {
                    
                    self.image.resizable() // it will sized so that it fills all the available space
                      .scaledToFit()
                      .frame(width: 550.0, height: 550.0)
                    
                    Button(
                        action: {
                            self.next = self.next + 1
                            if self.next == 11 {
                                self.next = 1
                            }
                            self.image = Image("tab" + String(self.next))
                        },
                        label: { Text("Next") }
                    ).padding(.top, 100)
                    
                    
                }
            
           }
       }
        
       let child = UIHostingController(rootView: ContentView())
       child.view.translatesAutoresizingMaskIntoConstraints = true
       child.view.frame = view.bounds
        
       view.addSubview(child.view)
       self.addChild(child)
    }
}
