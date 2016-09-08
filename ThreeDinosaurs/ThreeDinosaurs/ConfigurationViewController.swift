//
//  ConfigurationViewController.swift
//  ThreeDinosaurs
//
//  Created by Nicolai Henriksen on 08/09/16.
//  Copyright © 2016 ThreeDinosaurs. All rights reserved.
//

import UIKit

class ConfigurationViewController: UIViewController {
    @IBOutlet weak var ipAddrTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let hostname = UserDefaults.standard.object(forKey: "hostname") as! String
        ipAddrTextField.text = hostname
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
