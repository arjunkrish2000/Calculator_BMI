//
//  ViewController.swift
//  CalBMI
//
//  Created by Kiran Kishore on 12/03/20.
//  Copyright © 2020 CDNS. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var bmi : Float?
    var weight : Float = 0.0
    var height : Float = 0.0
    
    @IBOutlet weak var bottomViewHeight: NSLayoutConstraint!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var userHeight: UILabel!
    @IBOutlet weak var userWeight: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bottomViewHeight.constant = view.frame.size.height/2
        
        userHeight.text = String(heightSlider.value)
        userWeight.text = String(weightSlider.value)
        
    }

    
    @IBAction func heightValueChanged(_ sender: UISlider) {
        height = sender.value
        userHeight.text = String(format: "%.2f", sender.value) + " m"
    }
    
    @IBAction func weightValueChanged(_ sender: UISlider) {
        weight = sender.value
        userWeight.text = String(format: "%.2f", sender.value) + " kg"
    }
    
    @IBAction func calButtonTapped(_ sender: UIButton) {
        if height != 0.0 && weight != 0.0 {
        findBMI()
        }
        else{
            print("Enter a valid height & weight")
        }
    }
   
    func findBMI(){
        
        
        bmi = weight/(height * height)
        print("BMI is :\(bmi ?? 0.0)")
        performSegue(withIdentifier: "showBMI", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBMI" {
            let VC = segue.destination as! BMIViewController
             
            VC.userBMI = bmi ?? 0.0
            print(VC.userBMI
            )
        }else{
           print("Error, wrong segue.")
        }
    }
}

