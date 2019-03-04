//
//  ViewController.swift
//  BullsEye
//
//  Created by Dillon Cain on 2/19/19.
//  Copyright © 2019 Cain Computers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var targetValue = 0
    // variable created to store random value
    
    @IBOutlet weak var slider: UISlider!
    // Instance variable to reference slider (Data type is UISlider!)
    @IBOutlet weak var targetLabel: UILabel!
    // Instance variable to reference label (Data type is UILabel!)
    var currentValue: Int = 0
        
        // Initialize currentValue for slider.
        // Bugfix (Put value where the slider will start at, not 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound() // Calling method (viewDidLoad happens just once)
    }

    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        // Calculates difference with slider position and keeps number positive
        let message = "You scored \(points) points" +
        "\nThe difference is: \(difference)"
        
        let alert = UIAlertController(title: "H, W",
                                    message: message,
                             preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok",
                                   style: .default,
                                 handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        // When (Hit Me) button is pressed a pop up window (showAlert()) will occur with the title & message above.
        startNewRound()
        // After player presses (Hit Me!), the round will start over
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        // When slider is moved, updated slider (slider.value) will display.
        // Action method (Allows interface builder to see the method and connect it to a button)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        // Generate random number and assign to targetValue
        // Regular method
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels() // Calls updateLabels
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        // Regular method
    }
}
