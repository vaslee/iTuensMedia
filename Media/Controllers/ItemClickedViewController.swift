//
//  ItemClickedViewController.swift
//  Media
//
//  Created by TingxinLi on 11/7/19.
//  Copyright © 2019 TingxinLi. All rights reserved.
//

import UIKit

class ItemClickedViewController: UIViewController {

    private var item: Media!
      private var itemImage: UIImage!
      
      let itemDetailledView = ItemDetailView()
      private var tapGesture: UITapGestureRecognizer!
      
      
      init(item:Media){
        super.init(nibName: nil, bundle: nil)
        self.item = item
      }
      
      required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
      }
      
      override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(itemDetailledView)
        setUpTapGesture()
        setUpUi()
        setUpViewConstraints()
      }
      
      
    private func setUpTapGesture(){
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        self.view.addGestureRecognizer(tapGesture)
      }
      
      func setUpViewConstraints(){
        itemDetailledView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        itemDetailledView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        itemDetailledView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        itemDetailledView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
      }
      override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        setUpViewConstraints()
      }
      
      
      
      @objc func dismissView(){
        dismiss(animated: true, completion: nil)
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
      
     private func setUpUi(){
        let mediaItem = item
        let urlString = mediaItem?.artworkUrl100 ?? "no URLString found"
        getItemImage(urlString: urlString, imageView: itemDetailledView.mediaImage)
        itemDetailledView.mediaName.text = "\(item.name.capitalized)"
        itemDetailledView.mediaDescription.text = """
        ArtistName: \(mediaItem?.artistName ?? "No artist name found")
        
        ReleaseDate: \(mediaItem?.releaseDate ?? "No release date found")
        
        MediaType: \(mediaItem?.kind.capitalized ?? "No media type Found")
        
        \(mediaItem?.copyright ?? "no copyRight information found")
        
        More from Artist: \(mediaItem?.artistUrl.absoluteString ?? "no URL found")
        """
      }
    

   

}
