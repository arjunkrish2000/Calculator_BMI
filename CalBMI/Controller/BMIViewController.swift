//
//  BMIViewController.swift
//  CalBMI
//
//  Created by Kiran Kishore on 12/03/20.
//  Copyright © 2020 CDNS. All rights reserved.
//

import UIKit

class BMIViewController: UIViewController {
    
    var userBMI : Float = 0.0

    @IBOutlet weak var displayBMI: UILabel!
    
    @IBOutlet weak var displayAdvice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
showBMI()
    }
    
    func showBMI(){
        print("Your BMI is \(userBMI)")
        displayBMI.text = "Your BMI is " + String(format : "%.2f",userBMI)
        
        if userBMI > 18.5 && userBMI < 24.9 {
            displayAdvice.text = "You are healthy. Maintain current calorie intake."
        }else if userBMI > 24.9 {
            displayAdvice.text = "You are overweight. Decrease calorie intake."
        }else if userBMI < 18.5{
            displayAdvice.text = "You are underweight. Increase calorie intake."
        }
    }
    
    @IBAction func recalculateBttn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
