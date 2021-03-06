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
    
    @IBOutlet weak var roundTextLabel: UILabel!
    
    //MARK:- Properties
    var _currentValue = 0
    var _targetValue = 0
    var _round = 0
    var _totalScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewRound()
        UpdateLabels()
        
        //Customizing the Slider by code
        //Load images from xcassets
        
       
        //Set images for the thumb of the slider with states
        let sliderThumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(sliderThumbImageNormal, for: .normal)
       
        let sliderThumbHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(sliderThumbHighlighted, for: .highlighted)
        
        //For the slider bar
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        //Add and set image that will represent left side of slider
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizeable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizeable, for: .normal)
        
        //Add and set image that represents right side of slider
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizeable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizeable, for: .normal)
    
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
        roundTextLabel.text = String(_round)
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
            title = NSLocalizedString("titleOfAlert1", comment: "Title of the alert")
        }else if difference == 1 {
            points += 50
            title = NSLocalizedString("titleOfAlert2", comment: "Another title of the alert")
        }else if difference < 5 {
            title = NSLocalizedString("titleOfAlert3", comment: "Another title of the alert")
        }else if difference < 10 {
            title = NSLocalizedString("titleOfAlert4", comment: "Another one")
        }else {
            title = NSLocalizedString("notEvenClose", comment: "alert title string")
        }
        
        _totalScore += points
        
        
        let msg = String(format: NSLocalizedString("You scored %@ points", comment: ""), "\(points)")
        let alertMessage = msg
        //write logic to to show alert view here
        let alert = UIAlertController(title:"\(title)", message: alertMessage, preferredStyle: .alert)
        
        //Add a text field to the alert view
        let action = UIAlertAction(title: NSLocalizedString("awesome", comment: "Says Awesome"), style: .default, handler: {_ in
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
        
     //Add core animation using QuartzCore being applies to all of the screen
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        view.layer.add(transition, forKey: nil)
    }
    

    
}

