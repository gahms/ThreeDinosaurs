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
    let imageHandler : ImageHandler
    let url : URL
    
    init(url : URL, handler : @escaping ImageHandler) {
        self.imageHandler = handler
        self.url = url
    }
    
    func fetch() {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data , error == nil else { return }
            let img = UIImage(data: data)!
            DispatchQueue.main.async() { () -> Void in
                self.imageHandler(img)
            }
            }.resume()
        /*
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data , error == nil else { return }
            let img = UIImage(data: data)!
            DispatchQueue.main.async() { () -> Void in
                self.imageHandler(img)
            }
        }
         */
    }

    /*
    func getDataFromUrl(url: URL, completion: @escaping ((_ data: Data?, _ response: URLResponse?, _ error: NSError? ) -> Void)) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            completion(data, response, error)
        }.resume()
    }
 */
}
