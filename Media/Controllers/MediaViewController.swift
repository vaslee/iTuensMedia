//
//  ViewController.swift
//  Media
//
//  Created by TingxinLi on 10/29/19.
//  Copyright © 2019 TingxinLi. All rights reserved.
//

import UIKit


class MediaViewController: UIViewController {
    
  let mediaView = MediaView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mediaView.mainTableView.dataSource = self
        mediaView.mainTableView.delegate = self
        view.addSubview(mediaView)
        self.mediaView.mainTableView.register(DetailCell.self, forCellReuseIdentifier: "DetailCell")
        
    }


}

extension MediaViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = mediaView.mainTableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as? DetailCell else { return UITableViewCell() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mediaView.mainTableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
