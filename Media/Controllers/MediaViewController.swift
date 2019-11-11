//
//  ViewController.swift
//  Media
//
//  Created by TingxinLi on 10/29/19.
//  Copyright © 2019 TingxinLi. All rights reserved.
//

import UIKit


class MediaViewController: UIViewController {
    
    var mediaInfos = [Media]() {
        didSet {
            DispatchQueue.main.async {
                self.mediaView.mainTableView.reloadData()
            }
        }
    }
    
    
    let mediaView = MediaView()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mediaView)
        mediaView.mainTableView.dataSource = self
        mediaView.mainTableView.delegate = self
        self.mediaView.mainTableView.register(DetailCell.self, forCellReuseIdentifier: "DetailCell")
        
        getMediaItems()
        setUpViewConstraints()
        
    }
    private func getMediaItems(){
        
      MediaAPIClient.searchMedia { (error, mediaInfo) in
        if let error = error {
        print(error.errorMessage())
        }
        if let mediaInfo = mediaInfo {
            self.mediaInfos = mediaInfo
            
        }
      }
    }
    
    
    private func getItemImage(urlString:String,imageView:UIImageView){
        if let image = ImageHelper.fetchImageFromCache(urlString: urlString){
        DispatchQueue.main.async {
          imageView.image = image
        }
      }else{
        ImageHelper.fetchImageFromNetwork(urlString: urlString) { (error, image) in
          if let error = error {
            print(error.errorMessage())
          }
          if let image = image {
            DispatchQueue.main.async{
            imageView.image = image
            }
          }
        }
      }
    }
    
    private func setUpViewConstraints(){
       
       mediaView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
       mediaView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
       mediaView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
       mediaView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
       
     }
}

extension MediaViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaInfos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = mediaView.mainTableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as? DetailCell else { fatalError("DetailCell error") }
        
                       let mediaItem = mediaInfos[indexPath.row]
        cell.nameLabel.text = mediaItem.artistName
                        getItemImage(urlString: mediaItem.artworkUrl100, imageView: cell.productImage)
                        
                        if let mediaType = mediaInfos.first?.kind{
                            cell.typeLabel.text = mediaType
                        }
                    
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mediaView.mainTableView.deselectRow(at: indexPath, animated: true)
        let mediaItem = mediaInfos[indexPath.row]
             let itemDetailViewController = ItemClickedViewController.init(item: mediaItem)
               itemDetailViewController.modalPresentationStyle = .overCurrentContext
        itemDetailViewController.modalTransitionStyle = .flipHorizontal
               self.present(itemDetailViewController, animated: true, completion: nil)
             
           
    }
    
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      return "Media Type: iOS Apps"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return CGFloat.init(120)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
      setUpViewConstraints()
    }
}
