//
//  ViewController.swift
//  BullsEye
//
//  Created by Dillon Cain on 2/19/19.
//  Copyright © 2019 Cain Computers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    // Instance variable to reference slider (Data type is UISlider!)
    var currentValue: Int = 0
        
        // Initialize currentValue for slider.
        // Bugfix (Put value where the slider will start at, not 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentValue = lroundf(slider.value)
    }

    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)"
        
        let alert = UIAlertController(title: "Hello, World",
                                    message: message,
                             preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok",
                                   style: .default,
                                 handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        // When (Hit Me) button is pressed a pop up window (showAlert()) will occur with the title & message above.
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        // When slider is moved, updated slider (slider.value) will display.
    }
    
}

