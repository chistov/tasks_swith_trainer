//
//  MathCtrl.swift
//  Tasks Switcher Trainer
//
//  Created by chistov on 12.06.2020.
//  Copyright © 2020 Sergey Chistov. All rights reserved.
//

import UIKit
import SwiftUI

class MathCtrl: UIViewController {
    
    var param: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .darkGray
        navigationItem.title = "Math"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "close_cross").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
//        configureUI()
        content()
        
        if let param = param {
            print("param: \(param)")
        }
    }
    
    @objc func handleDismiss(){
        dismiss(animated: true, completion: nil)
    }
    
    func content(){
        let textField = UITextField()
        textField.textColor = UIColor.red
        textField.text = "String(a1)"
        
        
        
        struct ContentView : View {
            @State private var a1 = Int.random(in: 101...499)
            @State private var b1 = Int.random(in: 101...499)
            
            @State private var a2 = Int.random(in: 101...499)
            @State private var b2 = Int.random(in: 101...499)
            
            @State private var a3 = Int.random(in: 101...499)
            @State private var b3 = Int.random(in: 101...499)
            
            @State private var a4 = Int.random(in: 101...499)
            @State private var b4 = Int.random(in: 101...499)
            
            
            @State private var show: Bool = false

            var body: some View {
                GeometryReader { geometry in
                    VStack(alignment: .leading) {
                        Button(
                            action: {
                                self.show = !self.show
                            },
                            label: { Text("Show result") }
                        )
                        
                        Text(String(self.a1) + "+" + String(self.b1)).padding(.top, 20)
                        if self.show {
                            Text(String(self.a1 + self.b1))
                        } else {
                            Text("???")
                        }
                        
                        Text(String(self.a2) + "+" + String(self.b2)).padding(.top, 20)
                        if self.show {
                            Text(String(self.a2 + self.b2))
                        } else {
                            Text("???")
                        }
                        
                        Text(String(self.a3) + "+" + String(self.b3)).padding(.top, 20)
                        if self.show {
                            Text(String(self.a3 + self.b3))
                        } else {
                            Text("???")
                        }
                        
                        Text(String(self.a4) + "+" + String(self.b4)).padding(.top, 20)
                        if self.show {
                            Text(String(self.a4 + self.b4))
                        } else {
                            Text("???")
                        }
                        
                        Button(
                            action: {
                                self.a1 = Int.random(in: 101...499)
                                self.b1 = Int.random(in: 101...499)
                                
                                self.a2 = Int.random(in: 101...499)
                                self.b2 = Int.random(in: 101...499)
                                
                                self.a3 = Int.random(in: 101...499)
                                self.b3 = Int.random(in: 101...499)
                                
                                self.a4 = Int.random(in: 101...499)
                                self.b4 = Int.random(in: 101...499)
                            },
                            label: { Text("Next") }
                        ).padding(.top, 20)
                    }
                }
                
            }

        }
        
        let child = UIHostingController(rootView: ContentView())
        child.view.translatesAutoresizingMaskIntoConstraints = true
        child.view.frame = view.bounds
        
//        let child1 = UIHostingController(rootView: ContentView1())
//        child1.view.translatesAutoresizingMaskIntoConstraints = true
//        child1.view.frame = view.bounds
//
//
        view.addSubview(child.view)
        self.addChild(child)
        
//        view.addSubview(child1.view)
//        self.addChild(child1)
        
//        view.addSubview(textField.view)
//        var textFiled = UITextField(frame: CGRectMake(20.0, 30.0, 100.0, 33.0))
//        textFiled.backgroundColor = UIColor.redColor()
//        textFiled.borderStyle = UITextBorderStyle.Line
//        self.view.addSubview(textField)
    }
    
    func configureUI(){
        view.backgroundColor = .white
        
        navigationController?.navigationBar.barTintColor = .red
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Math"
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "close_cross").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
    }
    
}

struct MathCtrl_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
