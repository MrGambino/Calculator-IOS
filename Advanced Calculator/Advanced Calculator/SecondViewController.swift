//
//  SecondViewController.swift
//  Calculator
//
//  Created by Sirak Berhane on 2018-06-04.
//  Copyright © 2018 Sirak Berhane. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {


    @IBOutlet weak var TextDisplayPreviousValue: UILabel!
    @IBOutlet weak var TextDisplayCurrentOutput: UILabel!

    var receivedStringOutput = ""
    var receivedStringPrevious = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        TextDisplayCurrentOutput.text = receivedStringOutput
        TextDisplayPreviousValue.text = receivedStringPrevious
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
