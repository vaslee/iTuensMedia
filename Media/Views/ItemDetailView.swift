//
//  ItemDetailView.swift
//  Media
//
//  Created by TingxinLi on 11/7/19.
//  Copyright © 2019 TingxinLi. All rights reserved.
//

import UIKit

class ItemDetailView: UIView {
    
    lazy var visualEffectsViews:UIVisualEffectView = {
      let view = UIVisualEffectView()
      view.effect = UIBlurEffect(style: .dark)
      
      return view
    }()
    
    lazy var displayView:UIView = {
      let view = UIView()
      view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
      view.contentMode = .scaleAspectFit
      return view
    }()
 
    lazy var mediaImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "placeholder"))
        image.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        image.layer.cornerRadius = 8
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var mediaName: UILabel = {
        let nameLabel = UILabel()
        nameLabel.layer.cornerRadius = 5
        nameLabel.layer.borderWidth = 2
        nameLabel.layer.borderColor = UIColor.black.cgColor
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.textAlignment = .center
        return nameLabel
    }()
    
    lazy var mediaDescription: UITextView = {
        let description = UITextView()
        description.layer.cornerRadius = 5
        description.layer.borderWidth = 2
        description.layer.borderColor = UIColor.black.cgColor
        description.textAlignment = .justified
        description.dataDetectorTypes = .link
        description.isEditable = false
        description.isScrollEnabled = false
        description.text = "Media Description"
        description.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    
        return description
    }()
    
      override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
      }
      
      required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
      }
      
      func commonInit(){
        setUpViews()
        backgroundColor = .clear
        contentMode = .center
        translatesAutoresizingMaskIntoConstraints = false
      }
}
extension ItemDetailView {
    func setUpViews() {
        setUpVisualEffectViewConstraints()
    }
    func setUpVisualEffectViewConstraints(){
      addSubview(visualEffectsViews)
      visualEffectsViews.translatesAutoresizingMaskIntoConstraints = false
      visualEffectsViews.topAnchor.constraint(equalTo: topAnchor).isActive = true
      visualEffectsViews.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
      visualEffectsViews.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
      visualEffectsViews.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
      setUpDisplayView()
      setUpMediaImageConstraints()
      setUpMediaNameConstraints()
      setUpMediaDescriptionConstraints()
    }
    func setUpDisplayView(){
      visualEffectsViews.contentView.addSubview(displayView)
      displayView.translatesAutoresizingMaskIntoConstraints = false
      displayView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
      displayView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
      displayView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.8).isActive = true
      displayView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
    }
    func setUpMediaImageConstraints(){
      displayView.addSubview(mediaImage)
      mediaImage.translatesAutoresizingMaskIntoConstraints = false
      mediaImage.topAnchor.constraint(equalToSystemSpacingBelow: displayView.topAnchor, multiplier: 2.5).isActive = true
      mediaImage.widthAnchor.constraint(equalTo: displayView.widthAnchor, multiplier: 0.5).isActive = true
      mediaImage.heightAnchor.constraint(equalTo: displayView.heightAnchor, multiplier: 0.3).isActive = true
      mediaImage.centerXAnchor.constraint(equalTo: displayView.centerXAnchor).isActive = true
    }
    func setUpMediaNameConstraints(){
      displayView.addSubview(mediaName)
      mediaName.translatesAutoresizingMaskIntoConstraints = false
      mediaName.topAnchor.constraint(equalToSystemSpacingBelow: mediaImage.bottomAnchor, multiplier: 1.4).isActive = true
      mediaName.widthAnchor.constraint(equalTo: mediaImage.widthAnchor, multiplier: 0.9).isActive = true
      mediaName.heightAnchor.constraint(equalTo: mediaImage.heightAnchor, multiplier: 0.2).isActive = true
      mediaName.centerXAnchor.constraint(equalTo: displayView.centerXAnchor).isActive = true
    }
    
    func setUpMediaDescriptionConstraints(){
      displayView.addSubview(mediaDescription)
      mediaDescription.translatesAutoresizingMaskIntoConstraints = false
      mediaDescription.topAnchor.constraint(equalToSystemSpacingBelow: mediaName.bottomAnchor, multiplier: 1.4).isActive = true
      mediaDescription.widthAnchor.constraint(equalTo: displayView.widthAnchor, multiplier: 0.9).isActive = true
      mediaDescription.heightAnchor.constraint(equalTo: mediaImage.heightAnchor, multiplier: 1.6).isActive = true
      mediaDescription.centerXAnchor.constraint(equalTo: displayView.centerXAnchor).isActive = true
    }
}
