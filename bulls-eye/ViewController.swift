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
    var _currentValue = 0
    var _targetValue = 0
    var _round = 0
    var _totalScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewRound()
        UpdateLabels()
    
    }
    //MARK:- Methods
    func startNewRound() {
        _targetValue = 1 + Int(arc4random_uniform(100))
        _currentValue = 50
        slider.value = Float(_currentValue)
        _round += 1
        
    }
    
    func UpdateLabels(){
        targatValueLabel.text = String(_targetValue)
        totalScoreTextLabel.text = String(_totalScore)
        roundtextLabel.text = String(_round)
    }
    
    func startNewGame(){
        _totalScore = 0
        _round = 0
        startNewRound()
    }

    //MARK:- Actions
    @IBAction func showAlert() {
        
        let title:String
        let difference = abs(_currentValue - _targetValue)
        
        var points = 100 - difference
        
        if difference == 0 {
            points += 100
            title = "Perfect, Extra 200pts."
        }else if difference == 1 {
            points += 50
            title = "Missed by a Wisker,bonus 50pts"
        }else if difference < 5 {
            title = "Almost had it"
        }else if difference < 10 {
            title = "Pretty Close"
        }else {
            title = "Not even Close"
        }
        
        _totalScore += points
        
        let alertMessage = "You scored \(points) points"
        //write logic to to show alert view here
        let alert = UIAlertController(title:"\(title)", message: alertMessage, preferredStyle: .alert)
        
        //Add a text field to the alert view
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {_ in
            self.startNewRound()
            self.UpdateLabels()
        })
        
        //Add action button that user clicks
        alert.addAction(action)
        
        //presernt the alertview
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        
        //When the slider moves set the slider value ,slider returns a float
        _currentValue = lround(Double(slider.value))
        
    }
    
    @IBAction func startOver(_ sender: UIButton) {
        
    //Sets totalScore and round = 0 and starts new round
        startNewGame()
        UpdateLabels()
    }
    
}

