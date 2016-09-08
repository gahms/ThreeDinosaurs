//
//  ThumbControllerView.swift
//  ThreeDinosaurs
//
//  Created by Svend Stagis on 08/09/16.
//  Copyright © 2016 ThreeDinosaurs. All rights reserved.
//

import UIKit


class ThumbControllerView: UIView {
    typealias EventHandler = (Void) -> Void
    var eventHandler : EventHandler = {}

    let convertFactor = CGFloat(4000.0)
    var beltControlSpeed = 0

    override func draw(_ rect: CGRect) {
        // Draw line for actual speed
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        updateControlBeltSpeed(touches.first!)
    }
    
    func updateControlBeltSpeed(_ touch : UITouch) {
        let location = touch.location(in: self)
        let yLoc = location.y
        
        let relPos = -(yLoc - self.bounds.midY)
        let converted = (convertFactor/self.bounds.midY) * relPos
        
        beltControlSpeed = 0
        if converted > 3000 {
            beltControlSpeed = 4000
        }
        else if converted > 2000 {
            beltControlSpeed = 3000
        }
        else if converted > 1000 {
            beltControlSpeed = 2000
        }
        else if converted > 500 {
            beltControlSpeed = 1000
        }
        else if converted < -3000 {
            beltControlSpeed = -4000
        }
        else if converted < -2000 {
            beltControlSpeed = -3000
        }
        else if converted < -1000 {
            beltControlSpeed = -2000
        }
        else if converted < -500 {
            beltControlSpeed = -1000
        }
 
        //beltControlSpeed = Int(converted.rounded())
        
        eventHandler();
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        beltControlSpeed = 0
        eventHandler();
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        updateControlBeltSpeed(touches.first!)
    }
    

}
