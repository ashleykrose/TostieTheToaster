//
//  ViewController.swift
//  Toastie The Toaster
//
//  Created by Ashley Roselius on 3/21/19.
//  Copyright © 2019 Ashley Roselius. All rights reserved.
//

import UIKit
import SwiftSocket

class ViewController: UIViewController {

    @IBOutlet weak var makeToastBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var ipAddressTxt: UITextField!
    @IBOutlet weak var toastLevelTxt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeToastBtn.layer.cornerRadius = 10
        cancelBtn.layer.cornerRadius = 10
        self.hideKeyboardWhenTappedAround()
    }
    @IBAction func toastLevelSld(_ sender: UISlider) {
        let toastValue = Int(sender.value)
        toastLevelTxt.text = "Toast Level: " + String(toastValue)
        let ipAddress: String = ipAddressTxt.text!
        let codeSent: String = String(toastValue + 1)
//        let codeSent: String = "1"
        let client = TCPClient(address: ipAddress, port: 1500)
        switch client.connect(timeout: 1) {
        case .success:
            switch client.send(string: codeSent ) {
            case .success:
                guard let data = client.read(1024*10) else { return }

                if let response = String(bytes: data, encoding: .utf8) {
                    print(response)
                }
            case .failure(let error):
                print(error)
            }
        case .failure(let error):
            print(error)
        }
    }
    @IBAction func onMakeToastClick(_ sender: UIButton) {
        let ipAddress: String = ipAddressTxt.text!
//        let codeSent: String = codeSentTxt.text!
        let codeSent: String = "9"
        let client = TCPClient(address: ipAddress, port: 1500)
        switch client.connect(timeout: 1) {
        case .success:
            switch client.send(string: codeSent ) {
            case .success:
                guard let data = client.read(1024*10) else { return }
                
                if let response = String(bytes: data, encoding: .utf8) {
                    print(response)
                }
            case .failure(let error):
                print(error)
            }
        case .failure(let error):
            print(error)
        }
    }
    @IBAction func onCancelClick(_ sender: Any) {
        let ipAddress: String = ipAddressTxt.text!
        let codeSent: String = "1"
        let client = TCPClient(address: ipAddress, port: 1500)
        switch client.connect(timeout: 1) {
        case .success:
            switch client.send(string: codeSent ) {
            case .success:
                guard let data = client.read(1024*10) else { return }
                
                if let response = String(bytes: data, encoding: .utf8) {
                    print(response)
                }
            case .failure(let error):
                print(error)
            }
        case .failure(let error):
            print(error)
        }
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
