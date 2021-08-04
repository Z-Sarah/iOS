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
    var customTips = [0.15, 0.18, 0.2]
    var tipDict = [0 : "tip0", 1 : "tip1", 2 : "tip2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"

        NotificationCenter.default.addObserver(self, selector: #selector(setDarkModeVC(_:)), name: Notification.Name("switchMode"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setCustomTips(_:)), name: Notification.Name("tip0"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setCustomTips(_:)), name: Notification.Name("tip1"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(setCustomTips(_:)), name: Notification.Name("tip2"), object: nil)
        
        tipControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue], for: .selected)
        
    }
    
    @objc func setCustomTips(_ notification: Notification) {
        let notificationName = notification.name.rawValue
        let index = Int(notification.name.rawValue.dropFirst(3))
        let myCustomTips = notification.object as! String?
        tipControl.setTitle(myCustomTips, forSegmentAt: index ?? 0)
        UserDefaults.standard.setValue(myCustomTips, forKey: notificationName)
        showCustomTip(customTip: myCustomTips!, index: index ?? 0)
    }
    
    func showCustomTip(customTip: String, index: Int) {
        let myCustomTip = customTip.dropLast()
        customTips[index] = Double(myCustomTip)!/100.0
    }
    
    @objc func setDarkModeVC(_ notification: Notification) {
        let isDarkMode = UserDefaults.standard.bool(forKey: "switchMode")
        if(isDarkMode) {
            view.backgroundColor = .black
            tipAmountLabel.textColor = .white
            totalLabel.textColor = .white
            text1.textColor = .white
            text2.textColor = .white
            text3.textColor = .white
        } else {
            view.backgroundColor = .white
            tipAmountLabel.textColor = .black
            totalLabel.textColor = .black
            billAmountTextField.textColor = .black
            text1.textColor = .black
            text2.textColor = .black
            text3.textColor = .black
        }
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = customTips
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip

        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

}

