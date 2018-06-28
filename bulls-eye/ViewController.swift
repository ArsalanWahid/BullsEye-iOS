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
    @IBOutlet weak var targatValueLabel: UILabel!
    @IBOutlet weak var totalScoreTextLabel: UILabel!
    
    @IBOutlet weak var roundtextLabel: UILabel!
    
    
    
    //MARK:- Properties
    var currentValue = 0
    var targetValue = 0
    var round = 0
    var totalScore = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewRound()
        UpdateLabels()
    
    }
    
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        
    }
    
    func UpdateLabels(){
        targatValueLabel.text = String(targetValue)
        totalScoreTextLabel.text = String(totalScore)
        roundtextLabel.text = String(round)
    }
    
    func calcualteScore(){
    }

    //MARK:- Actions
    @IBAction func showAlert() {
        
        let difference = abs(currentValue - targetValue)
        let points = 100 - difference
        totalScore += points
        let alertMessage = "You scored \(points) points"
        
        //write logic to to show alert view here
        let alert = UIAlertController(title:"Hello World", message: alertMessage, preferredStyle: .alert)
        
        //Add a text field to the alert view
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        //Add action button that user clicks
        alert.addAction(action)
        
        //presernt the alertview
        present(alert, animated: true, completion: nil)
        
        startNewRound()
        UpdateLabels()
        
    }
    
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        
        //When the slider moves set the slider value ,slider returns a float
        currentValue = lround(Double(slider.value))
        
    }
    
    @IBAction func startOver(_ sender: UIButton) {
        totalScore = 0
        round = 0
    }
    
    
    
}

