//
//  ViewController.swift
//  mycalculator
//
//  Created by 麥可不可 on 2021/4/10.
//

import UIKit

class ViewController: UIViewController{
    var numberOnScreen:Double = 0
    var previousNumberOnScreen:Double = 0
    var performingMath:Bool = false
    var operation: OperationType = .none
    var newCalculation = true
    
  
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    
    @IBOutlet weak var label: UILabel!
    enum OperationType{
        case add
        case subtract
        case multiply
        case divide
        case none
    }
    //  判斷數值是否為整數，同時判斷循環小數顯示位數
    func checkTheNumber (number:Double) {
        var okText:String
        if (floor(number) == number) {
            okText = "\(Int(number))"
        } else {
            okText = "\(number)"
        }
        if okText.count >= 9 {
            okText = String(okText.prefix(9))
        }
        label.text = okText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //  數字鍵們的IBAction
    @IBAction func numbers(_ sender: UIButton) {
        guard ((label.text?.count ?? 0) < 4)
        else{
            return
        }
        let inputNumber = sender.tag

        if (label.text != nil) {
            if (newCalculation == true) {
                label.text = "\(inputNumber)"
                newCalculation = false
            } else {
                if (label.text == "0" || label.text == "+" || label.text == "-" || label.text == "x" || label.text == "/") {
                    label.text = "\(inputNumber)"
                }else {
                    label.text = label.text! + "\(inputNumber)"
                }
            }
            numberOnScreen = Double(label.text!) ?? 0
        }
    }
    
    //  clear的IBAction
    @IBAction func clearButton(_ sender: UIButton) {
        label.text = "0"
        numberOnScreen = 0
        previousNumberOnScreen = 0
        performingMath = false
        operation = .none
        newCalculation = true
    }
    
    //  add的IBAction
    @IBAction func add(_ sender: UIButton) {
        if previousNumberOnScreen != 0{
            nowAnswer()
        }
        label.text = "+"
        operation = .add
        performingMath = true
        previousNumberOnScreen = numberOnScreen
        newCalculation = false
    }
    
    //  subtract的IBAction
    @IBAction func subtract(_ sender: UIButton) {
        if previousNumberOnScreen != 0{
        nowAnswer()
    }
    label.text = "-"
    operation = .subtract
    performingMath = true
    previousNumberOnScreen = numberOnScreen
    newCalculation = false
    }
    
    //  mutiply的IBAction
    @IBAction func mutiply(_ sender: UIButton) {
        if previousNumberOnScreen != 0{
            nowAnswer()
        }
        label.text = "x"
        operation = .multiply
        performingMath = true
        previousNumberOnScreen = numberOnScreen
        newCalculation = false
    }
    
    //  divide的IBAction
    @IBAction func divide(_ sender: UIButton) {
        if previousNumberOnScreen != 0{
            nowAnswer()
        }
        label.text = "/"
        operation = .divide
        performingMath = true
        previousNumberOnScreen = numberOnScreen
        newCalculation = false
    }
    
    //  negative的IBAction
    @IBAction func negativeButton(_ sender: UIButton) {
        numberOnScreen = (numberOnScreen * -1)
        checkTheNumber(number: numberOnScreen)
    }
    
    // percentage的IBAction

    @IBAction func percentageButton(_ sender: UIButton) {
        numberOnScreen = (numberOnScreen / 100)
        checkTheNumber(number: numberOnScreen)
    }
    
    // dut的IBAction
    @IBAction func dutButton(_ sender: UIButton) {
        if (label.text != nil) {
            if (newCalculation == true) {
                label.text = "0."
                newCalculation = false
            } else {
                label.text = label.text! + "."
            }
        }
    }
    
    //  answer的IBAction
    @IBAction func answer(_ sender: UIButton) {
        if (performingMath == true) {
            switch operation {
                case .add:
                    numberOnScreen = previousNumberOnScreen + numberOnScreen
                    checkTheNumber(number: numberOnScreen)
                case .subtract:
                    numberOnScreen = previousNumberOnScreen - numberOnScreen
                    checkTheNumber(number: numberOnScreen)
                case .multiply:
                    numberOnScreen = previousNumberOnScreen * numberOnScreen
                    checkTheNumber(number: numberOnScreen)
                case .divide:
                    numberOnScreen = previousNumberOnScreen / numberOnScreen
                    checkTheNumber(number: numberOnScreen)
                case .none:
                    label.text = ""
            }
            performingMath = false
            newCalculation = true
        }
    }
    
    func nowAnswer() {
        switch operation {
        case .add:
            numberOnScreen = previousNumberOnScreen + numberOnScreen
            checkTheNumber (number: numberOnScreen)
        case .subtract:
            numberOnScreen = previousNumberOnScreen - numberOnScreen
            checkTheNumber (number: numberOnScreen)
        case .multiply:
            numberOnScreen = previousNumberOnScreen * numberOnScreen
            checkTheNumber (number: numberOnScreen)
        case .divide:
            numberOnScreen = previousNumberOnScreen / numberOnScreen
            checkTheNumber (number: numberOnScreen)
        case .none:
            label.text = ""
        }
    }
}

