//
//  NewsInfoCell.swift
//  MyNews
//
//  Created by Keerthi Devipriya(kdp) on 16/04/23.
//

import UIKit

class NewsInfoCell: UITableViewCell {
    
    enum Constant {
        static let lightYellowColor = UIColor(red: 173/255.0, green: 216/255.0, blue: 230/255.0, alpha: 1.0)
    }

   static let reuseIdentifier = "NewsInfoCell"
    
    lazy var containerView : UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.lightYellowColor
        return view
    }()
    
    lazy var itemImg : UIImageView = {
        var imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    lazy var itemNameLbl : UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.text = "Item"
        return lbl
    }()
    
    func configure(model: NewsInfo?) {
        
        itemImg.image = UIImage(named: "magic")
        itemNameLbl.text = model?.source.name ?? ""
        
        setUpUI()
        setUpAutoLayout()
    }
    
    func setUpUI() {
        contentView.addSubview(containerView)
        containerView.addSubview(itemImg)
        containerView.addSubview(itemNameLbl)
        containerView.layer.cornerRadius = 16
    }
    
    func setUpAutoLayout() {
        NSLayoutConstraint.activate([
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            itemImg.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16),
            itemImg.rightAnchor.constraint(equalTo: itemNameLbl.leftAnchor, constant: -16),
            itemImg.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            itemImg.widthAnchor.constraint(equalToConstant: 48),
            itemImg.heightAnchor.constraint(equalToConstant: 48),
            
            
            itemNameLbl.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -8),
            itemNameLbl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            itemNameLbl.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            
        ])
    }

}

