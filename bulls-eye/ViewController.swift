//
//  ViewController.swift
//  bulls-eye
//
//  Created by Arsalan Wahid Asghar on 11/3/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- OUTLETS
    @IBOutlet weak var slider: UISlider!
    
    //MARK:- Properties
    var currentValue = 0
    var targetValue = 0
    var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewRound()
    
    }
    
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    
    
    
    
    
    
    
    
    //MARK:- Actions
    @IBAction func showAlert() {
        
        let alertMessage = "The current value of the slider is \(currentValue)\nThe target value is \(targetValue) "
        
        //write logic to to show alert view here
        let alert = UIAlertController(title:"Hello World", message: alertMessage, preferredStyle: .alert)
        
        //Add a text field to the alert view
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        //Add action button that user clicks
        alert.addAction(action)
        
        //presernt the alertview
        present(alert, animated: true, completion: nil)
        
        startNewRound()
        
    }
    
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        
        //When the slider moves set the slider value
        currentValue = lround(Double(slider.value))
        
    }
    
    
    
}

