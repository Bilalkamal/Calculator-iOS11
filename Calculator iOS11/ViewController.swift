//
//  ViewController.swift
//  Calculator iOS11
//
//  Created by Bilal on 2018-02-26.
//  Copyright © 2018 Bilal Kamal Co. All rights reserved.
//

import UIKit
enum Operation:String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case NULL = "Null"
}



class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .NULL
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLabel.text = "0"
        
        
    }

    @IBAction func numberPressed(_ sender: RoundButton) {
        if runningNumber.count <= 8 {
            runningNumber += "\(sender.tag)"
            outputLabel.text = runningNumber
        }
    }
    
    @IBAction func allClearPressed(_ sender: RoundButton) {
         runningNumber = ""
         leftValue = ""
         rightValue = ""
         result = ""
         currentOperation = .NULL
         outputLabel.text = "0"
        
    }
    
    @IBAction func dotPressed(_ sender: RoundButton) {
        if runningNumber.count <= 7 {
            runningNumber += "."
            outputLabel.text = runningNumber
        }
        
    }
    
    
    @IBAction func equalPressed(_ sender: RoundButton) {
        operation(operation: currentOperation)
        
    }
    
    @IBAction func addPressed(_ sender: RoundButton) {
        operation(operation: .Add)
        
    }
    
    @IBAction func subtractPressed(_ sender: RoundButton) {
        operation(operation: .Subtract)
        
    }
    @IBAction func multiplyPressed(_ sender: RoundButton) {
        operation(operation: .Multiply)
        
    }
    @IBAction func dividePressed(_ sender: RoundButton) {
        operation(operation: .Divide)
        
    }
    @IBAction func percentPressed(_ sender: RoundButton) {
       percentPressed()
        
    }
    
    @IBAction func negativeToPositivePressed(_ sender: RoundButton) {
        
        convertNum()
        
    }
    
    func operation(operation : Operation){
        if currentOperation != .NULL {
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    result = "\(Float(Double(leftValue)! + Double(rightValue)!))"
                }else if currentOperation == .Subtract {
                    result = "\(Float(Double(leftValue)! - Double(rightValue)!))"
                }else if currentOperation == .Multiply {
                    result = "\(Float(Double(leftValue)! * Double(rightValue)!))"
                }else if currentOperation == .Divide {
                    result = "\(Float(Double(leftValue)! / Double(rightValue)!))"
                }
                leftValue = result
                if (Float(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                    result = "\(Int(Float(result)!))"
                }
                outputLabel.text = result
            }
            currentOperation = operation
            
        }else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
    
    
    func percentPressed(){
        
        leftValue = runningNumber
        if leftValue != "" {
            result = "\(Float(Double(leftValue)! / Double(100)))"
            
        }else if runningNumber != "" {
            leftValue = result
            result = "\(Float(Double(leftValue)! / Double(100)))"
        }
        
        
        runningNumber = result
        outputLabel.text = result
        
 

    }
    
    
    
    func convertNum(){
        currentOperation = .NULL

        if runningNumber != "" {
            result = "\(Float(runningNumber)! * -1)"
        }else {
            result = "\(Float(result)! * -1)"
        }
        if (Float(result)?.truncatingRemainder(dividingBy: 1) == 0) {
            result = "\(Int(Float(result)!))"
        }
        
        runningNumber = result
        outputLabel.text = result
        
        
    }
    
}

