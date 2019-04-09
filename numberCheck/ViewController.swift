//
//  ViewController.swift
//  numberCheck
//
//  Created by dit08 on 2019. 4. 9..
//  Copyright © 2019년 dit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblR: UILabel!
    @IBOutlet weak var text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        text.delegate = self as? UITextFieldDelegate
        text.placeholder = "ex) 7"
        text.clearButtonMode = UITextField.ViewMode.always
    }

    
    @IBAction func btnR(_ sender: Any) {
        if let number = Int(text.text!) {
            var isPrime = true
            
            if number <= 0 {
                lblR.text = "input correct value!"
                text.text = ""
                return
            }
            
            if number == 1 {
                isPrime = false
            }
            
            if number != 1 && number != 2 {
                for i in 2 ..< number {
                    if number % i == 0 {
                        isPrime = false
                    }
                }
            }
            
            if isPrime == true {
                lblR.text = "prime number"
            } else {
                lblR.text = "Not Prime number"
            }
            text.text = ""
        } else {
            print("nil 발생")
            lblR.text = "input numeric value!"
            text.text = ""
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        text.resignFirstResponder()
        return true
    }
    
}

