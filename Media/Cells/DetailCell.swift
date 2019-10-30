//
//  DetailCell.swift
//  Media
//
//  Created by TingxinLi on 10/29/19.
//  Copyright © 2019 TingxinLi. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) //设置字体颜色
        label.text = "I'm here!"
        label.textAlignment = .center //把字体放在中间
        label.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1) // 设置字体背景颜色
        return label
    }()
    
    lazy var typeLabel: UILabel = {
           let label = UILabel()
           label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) //设置字体颜色
           label.text = "I'm!"
           label.textAlignment = .center //把字体放在中间
           label.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1) // 设置字体背景颜色
           return label
       }()
    lazy var productImage: UIImageView = {
       let image = UIImageView(image: UIImage(named: "placeholder"))

        return image
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(nameLabel)
        self.addSubview(typeLabel)
        self.addSubview(productImage)
        setNameLabelConstraints()
        setTypeLabelConstraints()
        setImageConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -250).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
    }
    
    func setTypeLabelConstraints() {
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        typeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25).isActive = true
        typeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -250).isActive = true
        typeLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
    }
    
    func setImageConstraints() {
        productImage.translatesAutoresizingMaskIntoConstraints = false
        
        productImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        productImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 200).isActive = true
        productImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        //productImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80)
        productImage.heightAnchor.constraint(equalToConstant: 130).isActive = true
        productImage.widthAnchor.constraint(equalToConstant: 130).isActive = true
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
