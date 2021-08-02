//
//  ViewController.swift
//  Prework
//
//  Created by Sarah Zheng on 7/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var Settings: UIBarButtonItem!
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var text2: UILabel!
    @IBOutlet weak var text3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
        NotificationCenter.default.addObserver(self, selector: #selector(getDarkMode(_:)), name: Notification.Name("darkMode"), object: nil)
    }
    
    @objc func getDarkMode(_ notification: Notification) {
        let isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
        if(isDarkMode) {
            view.backgroundColor = .black
            tipAmountLabel.textColor = .white
            totalLabel.textColor = .white
            billAmountTextField.textColor = .white
            text1.textColor = .white
            text2.textColor = .white
            text3.textColor = .white
            tipControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue], for: .selected)
            
        } else {
            view.backgroundColor = .white
            tipAmountLabel.textColor = .black
            totalLabel.textColor = .black
            billAmountTextField.textColor = .black
            text1.textColor = .black
            text2.textColor = .black
            text3.textColor = .black
            tipControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        }
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
        
    }

}

