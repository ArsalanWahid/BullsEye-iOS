//
//  ViewController.swift
//  bulls-eye
//
//  Created by Arsalan Wahid Asghar on 11/3/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- Properties
    var currentvalue:Int = 50
    var targetValue:Int = 0
    var score = 0
    var round = 0
    //MARK:- Outlets
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    
    
    
    //MARK:- Controller Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewRound()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:- Actions
    @IBAction func sliderMoved(_ sender: UISlider) {
        
        //Slider == sender
        currentvalue = lroundf(sender.value)
        print("Value of slider \(currentvalue)")
    }
    
    
    /**
     initiate new random value set cursor to default 
     */
    fileprivate func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentvalue = 50
        slider.value = Float(currentvalue)
        round += 1
        updateLabels()
    }
    
    
   
    
    
    /**
     Updates all the labels on screen
     */
    fileprivate func updateLabels(){
        targetValueLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    /**
     This method shows alert on screen
     - Author:
     Arsalan Wahid Asghar
     */
    @IBAction func showAlert(){
        let title : String
        let difference = abs(targetValue - currentvalue)
        var points = 100 - difference
        //Title setting
        if difference == 0{
            title = "Perfect"
            points += 100
        }else if difference <= 1 && difference > 0{
            title = "Nearly Perfect"
            points += 50
        }else if difference < 5{
            title = "Almost had it"
        }else if difference < 10{
            title = "Pretty Good"
        }else{
            title = "not even close.."
        }
        
        
        score += points
        
        let message = "You scored  \(points)"
        
        //how to make the alert screen
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let action2 = UIAlertAction(title: "cancel", style: .default, handler: nil)
        
        //Actions are added from left to right order
        alert.addAction(action2)
        alert.addAction(action)
        
        //Present viewController modally
        present(alert, animated: true, completion: nil)
        startNewRound()
       
    }
    
    /**
     Simply prints the input given
     
     - parameters:
     - number: The Integer value you want to be printed in console
     
     */
    private func runs(_ number : Int){
        print(number)
    }
    
    
    
    
    
}

