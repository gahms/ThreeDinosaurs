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
}
