//
//  secondPageViewController.swift
//  Calculator
//
//  Created by Sirak Berhane on 2018-06-01.
//  Copyright © 2018 Sirak Berhane. All rights reserved.
//

import Foundation
import UIKit

class secondPageViewController: UIViewController{

    @IBOutlet weak var secondPageTextDisplayOutput: UILabel!
    @IBOutlet weak var secondPageTextPreviousOutput: UILabel!

    var receivedStringOutput = ""
    var receivedStringPrevious = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        secondPageTextDisplayOutput.text! = receivedStringOutput
        secondPageTextPreviousOutput.text! = receivedStringPrevious
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
