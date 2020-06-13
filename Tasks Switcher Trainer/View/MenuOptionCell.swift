//
//  MenuOptionCell.swift
//  Tasks Switcher Trainer
//
//  Created by chistov on 11.06.2020.
//  Copyright © 2020 Sergey Chistov. All rights reserved.
//

import UIKit

class MenuOptionCell: UITableViewCell {
    
    let iconImgView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.backgroundColor = .darkGray
        return iv
    }()
    
    let descriptionLable: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Here is text"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // create properties for cells
        backgroundColor = .darkGray
        selectionStyle = .none
        
        addSubview(iconImgView)
        iconImgView.translatesAutoresizingMaskIntoConstraints = false
        iconImgView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImgView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        iconImgView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        iconImgView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(descriptionLable)
        descriptionLable.translatesAutoresizingMaskIntoConstraints = false
        descriptionLable.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        descriptionLable.leftAnchor.constraint(equalTo: iconImgView.rightAnchor, constant: 12).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
