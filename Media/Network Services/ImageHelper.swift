//
//  ImageHelper.swift
//  Media
//
//  Created by TingxinLi on 11/1/19.
//  Copyright © 2019 TingxinLi. All rights reserved.
//

import UIKit

final class ImageHelper {
  private init() {}
  
  private static var cache = NSCache<NSString, UIImage>()
  
  static func fetchImageFromNetwork(urlString: String, completion: @escaping (AppError?, UIImage?) -> Void) {
    NetworkHelper.shared.performDataTask(endpointURLString: urlString, httpMethod: "GET", httpBody: nil) { (appError, data ) in
      if let appError = appError {
        completion(appError, nil)
      } else if let data = data {
        DispatchQueue.global().async {
          if let image = UIImage(data: data) {
            cache.setObject(image, forKey: urlString as NSString)
            DispatchQueue.main.async {
              completion(nil, image)
            }
          }
        }
      }
    }
  }
  
  static func fetchImageFromCache(urlString: String) -> UIImage? {
    return cache.object(forKey: urlString as NSString)
  }
}
