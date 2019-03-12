//
//  ViewController.swift
//  BullsEye
//
//  Created by Dillon Cain on 2/19/19.
//  Copyright © 2019 Cain Computers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    // Initialize currentValue for slider.
    var targetValue = 0
    // variable created to store random value
    var scoreValue = 0
    // Type inference (Int)
    var roundNumber = 0
    // Type inference (Int)
    
    @IBOutlet weak var slider: UISlider!
    // Instance variable to reference slider (Data type is UISlider!)
    @IBOutlet weak var targetLabel: UILabel!
    // Instance variable to reference label (Data type is UILabel!)
    @IBOutlet weak var scoreLabel: UILabel!
    // Instance variable to reference label (Updates score with each round)
    @IBOutlet weak var roundLabel: UILabel!
    // Instance variable to reference label (Updates round)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound() // Calling method (viewDidLoad happens just once)
        updateLabels() // New target value calculated
    }

    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        // Built in function provided by Swift (foundation library) - absolute value
        var points = 100 - difference
        // Calculates difference with slider position and keeps number positive
        
        
        let title: String
        // Type inference only works with one line, hence title:String is required
        if difference == 0{
            title = "Perfect!"
            points += 100
            // Player awarded 100 points if exact
        } else if difference < 5 {
            title = "You almost had it!?"
            if difference == 1 {
                points += 50
                // Player awarded 50 points if off by 1
            }
        } else if difference < 10 {
            title = "Pretty close..."
        } else {
            title = "Not even close..."
        }
        
        scoreValue += points
        // Keeps track of score
        
        let message = "You scored \(points) points" +
        "\nThe difference is: \(difference)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: {
            action in
            self.startNewRound()
            // Closure to update round after alertis cleared
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        // When (Hit Me) button is pressed a pop up window (showAlert()) will occur with the title & message above.
        // After player clears alert message, the round will start over
        
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        // When slider is moved, updated slider (slider.value.rounded()) will display.
        // Action method (Allows interface builder to see the method and connect it to a button)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        // Generate random number and assign to targetValue
        // Regular method
        currentValue = 50
        slider.value = Float(currentValue)
        roundNumber += 1
        updateLabels() // Calls updateLabels
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        // Regular method converts targetValue from int to String
        scoreLabel.text = String(scoreValue)
        // Regular method converts scoreValue from int to String
        roundLabel.text = String(roundNumber)
        // Regualr method converts roundNumber from int to String
    }
}
