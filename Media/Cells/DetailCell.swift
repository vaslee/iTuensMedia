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
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "I'm here!"
        label.textAlignment = .center
       // label.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        label.layer.cornerRadius = 2.5
        label.layer.borderWidth = 0.5
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    lazy var typeLabel: UILabel = {
           let label = UILabel()
           label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
           label.text = "I'm!"
           label.textAlignment = .center //把字体放在中间
          // label.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
           label.layer.cornerRadius = 2.5
        label.layer.borderWidth = 0.5
           label.adjustsFontSizeToFitWidth = true
           
         return label
       }()
    
    lazy var productImage: UIImageView = {
       let image = UIImageView(image: UIImage(named: "placeholder"))
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 8
        
        return image
    }()
    
    lazy var dividerView:UIView = {
      let view = UIView()
      view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
      view.contentMode = .scaleAspectFit
      return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           commonInit()
       }
       
       private func commonInit() {
           backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
           setupCells()
       }
    
}
extension DetailCell {
    private func setupCells() {
        setNameLabelConstraints()
        setTypeLabelConstraints()
        setImageConstraints()
        setUpDividerViewConstraints()
    }
    
    func setNameLabelConstraints() {
        addSubview(nameLabel)
        addSubview(typeLabel)
        addSubview(dividerView)
        addSubview(productImage)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 2.5).isActive = true
           nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: dividerView.trailingAnchor, multiplier: 1.0).isActive = true
           nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
           nameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setTypeLabelConstraints() {
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: nameLabel.bottomAnchor, multiplier: 2.5).isActive = true
        typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: dividerView.trailingAnchor, multiplier: 1.0).isActive = true
        typeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        typeLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    func setUpDividerViewConstraints(){
      dividerView.translatesAutoresizingMaskIntoConstraints = false
      dividerView.leadingAnchor.constraint(equalToSystemSpacingAfter: productImage.trailingAnchor, multiplier: 1.6).isActive = true
      dividerView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 1.7).isActive = true
      dividerView.heightAnchor.constraint(equalToConstant: 95).isActive = true
      dividerView.widthAnchor.constraint(equalToConstant: 3).isActive = true
      
    }
    
    func setImageConstraints() {
        productImage.translatesAutoresizingMaskIntoConstraints = false
        
        productImage.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 2.5).isActive = true
        productImage.leadingAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.leadingAnchor, multiplier: 2.0).isActive = true
        productImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        productImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
    }


}
