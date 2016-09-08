//
//  ViewController.swift
//  ThreeDinosaurs
//
//  Created by Nicolai Henriksen on 08/09/16.
//  Copyright © 2016 ThreeDinosaurs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let dysonClient = DysonClient(host: "192.168.1.106")
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        dysonClient.connect()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        dysonClient.leftWheelSpeed = 1000
        
    }

}

