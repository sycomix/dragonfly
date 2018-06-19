//
//  ViewController.swift
//  dragonfly
//
//  Created by Michael Williams on 12/20/17.
//  Copyright © 2017 Michael D. Williams. All rights reserved.
//

import UIKit
import DJISDK

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        registerApp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func registerApp() {
        DJISDKManager.registerApp(with: self)
    }

}

extension ViewController: DJISDKManagerDelegate {
    func appRegisteredWithError(_ error: Error?) {
        var message = "Register App Succeeded"
        if error != nil {
            message = "Register App Failed: Please enter your App key in the plist file and check the network."
        } else {
            print(message)
        }
        showAlertView(with: "Register App", message: message)
    }

    func showAlertView(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }

}

