//
//  MediaView.swift
//  Media
//
//  Created by TingxinLi on 10/30/19.
//  Copyright © 2019 TingxinLi. All rights reserved.
//

import UIKit
//import ChamelonFramework


class MediaView: UIView {
    
    lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: frame, style: .grouped)
        tableView.backgroundColor = .yellow
        tableView.register(DetailCell.self, forCellReuseIdentifier: "DetailCell")
        tableView.contentMode = .scaleAspectFit
        return tableView
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
        contentMode = .scaleAspectFit
        translatesAutoresizingMaskIntoConstraints = false
    }
}
extension MediaView {
    func setUpViews(){
         setConstraints()
    }
    func setConstraints() {
        addSubview(mainTableView)
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        mainTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        mainTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true

    }
}
