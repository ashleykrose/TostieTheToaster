//
//  ViewController.swift
//  Toastie The Toaster
//
//  Created by Ashley Roselius on 3/21/19.
//  Copyright © 2019 Ashley Roselius. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var makeToastBtn: UIButton!
    @IBOutlet weak var setAlarmBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        makeToastBtn.layer.cornerRadius = 10
        setAlarmBtn.layer.cornerRadius = 10
    }


}

