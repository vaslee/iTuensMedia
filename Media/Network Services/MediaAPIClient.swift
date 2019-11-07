//
//  MediaAPIClient.swift
//  Media
//
//  Created by TingxinLi on 11/1/19.
//  Copyright © 2019 TingxinLi. All rights reserved.
//

import Foundation

final class MediaAPIClient {
    
    static func searchMedia(completionHandler: @escaping (AppError?, [Media]?) -> Void) {
        
        NetworkHelper.shared.performDataTask(endpointURLString: "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json", httpMethod: "GET", httpBody: nil, handler: { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
             if let data = data {
                            do {
                                let mediaData = try JSONDecoder().decode(MediaData.self, from: data)
                                completionHandler(nil, mediaData.feed?.results)
                            } catch {
                                completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    )}
}
