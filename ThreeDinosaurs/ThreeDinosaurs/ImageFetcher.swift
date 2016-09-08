//
//  ImageFetcher.swift
//  ThreeDinosaurs
//
//  Created by Nicolai Henriksen on 08/09/16.
//  Copyright © 2016 ThreeDinosaurs. All rights reserved.
//

import UIKit

class ImageFetcher: NSObject {
    typealias ImageHandler = (_ img: UIImage) -> Void
    var imageHandler : ImageHandler = {_ in }
    
    func fetch() {
        
    }
    
    /*
    func getDataFromUrl(url: URL, completion: @escaping ((_ data: Data?, _ response: URLResponse?, _ error: NSError? ) -> Void)) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            completion(data, response, error)
        }.resume()
    }
 */
}
