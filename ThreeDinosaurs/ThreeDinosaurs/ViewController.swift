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
    @IBOutlet weak var imageView: UIImageView!

    var dysonClient : DysonClient!
    var videoFeed : VideoFeed?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        //imageView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
        imageView.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        let hostname = UserDefaults.standard.object(forKey: "hostname") as! String
        dysonClient = DysonClient(host: hostname)
        videoFeed = VideoFeed()
        videoFeed?.setupVideoFeed(hostname, imageUpdatedEvent:{
            self.imageUpdated()
        })

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
    
    func imageUpdated() {
        self.imageView.image = self.videoFeed?.videoImage
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*
        dysonClient.eventListener = {
            self.label.text = self.dysonClient.distances.description
        }
        */
        statusLabel.text = "Connecting..."
        let success = dysonClient.connect()
        if success {
            statusLabel.text = "Connected"
        }
        else {
            statusLabel.text = "Connect failed"
        }
    }
    
    func videoUpdated() {
        imageView.image = videoFeed?.videoImage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        dysonClient.leftWheelSpeed = 0;
        dysonClient.rightWheelSpeed = 0;
        statusLabel.text = "Disconnecting..."
        dysonClient.disconnect()
        statusLabel.text = "Disconnected"
    }
    
    @IBAction func unwindFromConfiguration(segue:UIStoryboardSegue) {
        let s = segue.source as! ConfigurationViewController

        let hostname = s.ipAddrTextField.text!
        UserDefaults.standard.set(hostname,
                                  forKey: "hostname")
        dysonClient = DysonClient(host: hostname)
        videoFeed?.setupVideoFeed(hostname, imageUpdatedEvent:{
            self.imageUpdated()
        })
    }
}

