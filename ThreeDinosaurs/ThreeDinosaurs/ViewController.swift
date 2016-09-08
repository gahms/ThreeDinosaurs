//
//  ViewController.swift
//  ThreeDinosaurs
//
//  Created by Nicolai Henriksen on 08/09/16.
//  Copyright © 2016 ThreeDinosaurs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var leftThumbView: ThumbControllerView!
    @IBOutlet weak var rightThumbView: ThumbControllerView!
    @IBOutlet weak var statusLabel: UILabel!

    var dysonClient : DysonClient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let hostname = UserDefaults.standard.object(forKey: "hostname") as! String
        dysonClient = DysonClient(host: hostname)
        
        leftThumbView.eventHandler = {
            self.dysonClient.leftWheelSpeed = self.leftThumbView.beltControlSpeed
        }
        rightThumbView.eventHandler = {
            self.dysonClient.rightWheelSpeed = self.rightThumbView.beltControlSpeed
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*
        dysonClient.eventListener = {
            self.label.text = self.dysonClient.distances.description
        }
        */
        statusLabel.text = "Connecting..."
        dysonClient.connect()
        statusLabel.text = "Connected"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        dysonClient.leftWheelSpeed = 0;
        dysonClient.rightWheelSpeed = 0;
        statusLabel.text = "Disconnecting..."
        dysonClient.disconnect()
        statusLabel.text = "Disconnected"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        dysonClient.leftWheelSpeed = 1000
        
    }
    
    @IBAction func unwindFromConfiguration(segue:UIStoryboardSegue) {
        let s = segue.source as! ConfigurationViewController

        let hostname = s.ipAddrTextField.text!
        UserDefaults.standard.set(hostname,
                                  forKey: "hostname")
        dysonClient = DysonClient(host: hostname)
    }
}

