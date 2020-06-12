//
//  MenuOption.swift
//  Tasks Switcher Trainer
//
//  Created by chistov on 11.06.2020.
//  Copyright © 2020 Sergey Chistov. All rights reserved.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible {
    case Math
    case Shulte
    case Text
    
    var description: String {
        switch self {
            case .Math: return "Math"
            case .Shulte: return "Shulte"
            case .Text: return "Text"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Math: return UIImage(named: "math") ?? UIImage()
        case .Shulte: return UIImage(named: "shulte") ?? UIImage()
        case .Text: return UIImage(named: "math") ?? UIImage()
        }
    }
}
