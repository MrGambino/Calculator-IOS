//
//  ViewController.swift
//  Advanced Calculator
//
//  Created by Sirak Berhane on 2018-05-30.
//  Copyright © 2018 Sirak Berhane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TextDisplayOutput: UILabel!
    @IBOutlet weak var previousValueDisplay: UILabel!
    @IBOutlet weak var currentMode: UILabel!
    var numberOnDisplay: Double = 0
    var previousNumber: Double = 0
    var performingALU = false
    var decimalTriggered = false
    var operationValue = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func versionControl(_ sender: UIButton) {
        let alert = UIAlertController(title: "Version 0.0.2 dev: What's new ?\n", message: "* DEG or RAD mode display\n\n * Previous value display (shows the last value the user inputted)\n\n * 4 new modes (Factorial, square root, cube root, log function, and euler's constant)\n\n * Future implementation includes multi-function support with page control, graph maker, and many more.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default [OK Pressed]")

            case .cancel:
                print("cancel [CANCEL Pressed]")

            case .destructive:
                print("destructive [Destructive Type: After n seconds]")
            }}))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func numbersZeroToNineButtons(_ sender: UIButton) {
        if performingALU == true {
            TextDisplayOutput.text = String(sender.tag - 1)
            numberOnDisplay = Double(TextDisplayOutput.text!)!
            performingALU = false
        } else {
            TextDisplayOutput.text = TextDisplayOutput.text! + String(sender.tag - 1)
            numberOnDisplay = Double(TextDisplayOutput.text!)!
        }
    }

    @IBAction func clearDisplay(_ sender: UIButton) {
        TextDisplayOutput.text = ""
        decimalTriggered = false
    }

    @IBAction func decimalPoint(_ sender: UIButton) {
        if decimalTriggered == false {
            TextDisplayOutput.text = TextDisplayOutput.text! + "."
            decimalTriggered = true
        }
    }

    @IBAction func eulerConstant(_ sender: UIButton) {
        if (sender.tag == 20) { // Euler's Constant
            TextDisplayOutput.text = String(2.71828182846)
            decimalTriggered = false
        }
    }

    @IBAction func logFunction(_ sender: UIButton) {
        if (sender.tag == 21) { // Logarithmic Function
            TextDisplayOutput.text = String(log10(Double(numberOnDisplay)))
            decimalTriggered = false
        }
    }

    @IBAction func factorialFunction(_ sender: UIButton) {
        if (sender.tag == 22) { // Factorial Function
            TextDisplayOutput.text = String(factorial(Double(numberOnDisplay)))
            decimalTriggered = false
        }
    }

    @IBAction func sqrtFunction(_ sender: UIButton) {
        if (sender.tag == 23) { // Square Root
            TextDisplayOutput.text = String(sqrt((Double(numberOnDisplay))))
            decimalTriggered = false
        }
    }

    @IBAction func cubeSqrtFunction(_ sender: UIButton) {
        if (sender.tag == 24) { // Cube Root
           TextDisplayOutput.text = String(pow(((Double(numberOnDisplay))), 1.0/3.0))
            decimalTriggered = false
        }
    }

    @IBAction func operationButtonsALU(_ sender: UIButton) {
        /* Tag 14 -> Divide, Tag 15 -> Multiply, Tag 16 -> Subtract, Tag 17 -> Addition */

        if TextDisplayOutput.text != "" && sender.tag != 11 && sender.tag != 18 {
            previousNumber = Double(TextDisplayOutput.text!)!
            previousValueDisplay.text = String(previousNumber)

            if (sender.tag == 12) { // Negation Sign
                TextDisplayOutput.text = String(Double(TextDisplayOutput.text!)! * -1)
            }

            if (sender.tag == 13 ) { // Percent Sign
                TextDisplayOutput.text = String(Double(TextDisplayOutput.text!)! / 100)

            }

            if (sender.tag == 14) {
                TextDisplayOutput.text = "÷"
                decimalTriggered = false
            }

            if (sender.tag == 15) {
                TextDisplayOutput.text = "𝗫"
                decimalTriggered = false
            }

            if (sender.tag == 16) {
                TextDisplayOutput.text = "−"
                decimalTriggered = false
            }

            if (sender.tag == 17) {
                TextDisplayOutput.text = "+"
                decimalTriggered = false
            }

            operationValue = sender.tag
            performingALU = true;

        } else if sender.tag == 18 {

            if operationValue == 12 {
                TextDisplayOutput.text = TextDisplayOutput.text!
            }

            if operationValue == 14 {
                TextDisplayOutput.text = String(previousNumber / numberOnDisplay)
            }

            else if operationValue == 15 {
                TextDisplayOutput.text = String(previousNumber * numberOnDisplay)
            }

            else if operationValue == 16 {
                TextDisplayOutput.text = String(previousNumber - numberOnDisplay)
            }

            else if operationValue == 17 {
                TextDisplayOutput.text = String(previousNumber + numberOnDisplay)
            }

        } else if sender.tag == 11 {
            TextDisplayOutput.text = ""
            previousNumber = 0
            numberOnDisplay = 0
            operationValue = 0
        }
    }

    public func factorial(_ N: Double) -> Double {
        var mult = N
        var retVal: Double = 1.0
        while mult > 0.0 {
            retVal *= mult
            mult -= 1.0
        }
        return retVal
    }
}
