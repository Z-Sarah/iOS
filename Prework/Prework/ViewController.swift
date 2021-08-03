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
    var customTips = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        NotificationCenter.default.addObserver(self, selector: #selector(getNotification(_:)), name: Notification.Name("switchMode"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setCustomTip1(_:)), name: Notification.Name("customTip1"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setCustomTip2(_:)), name: Notification.Name("customTip2"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setCustomTip3(_:)), name: Notification.Name("customTip3"), object: nil)
        
        tipControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue], for: .selected)
    }
    
    @objc func setCustomTip1(_ notification: Notification) {
        var customTip1 = notification.object as! String?
        tipControl.setTitle(customTip1, forSegmentAt: 0)
        UserDefaults.standard.setValue(customTip1, forKey: "tip1")
        if customTip1?.last == "%" {
            customTip1!.removeLast()
        }
        customTips.append((Double(customTip1!)!/100.0))
    }
    
    @objc func setCustomTip2(_ notification: Notification) {
        var customTip2 = notification.object as! String?
        tipControl.setTitle(customTip2, forSegmentAt: 1)
        UserDefaults.standard.setValue(customTip2, forKey: "tip2")
        if customTip2?.last == "%" {
            customTip2!.removeLast()
        }
        customTips.append((Double(customTip2!)!/100.0))
    }
    
    @objc func setCustomTip3(_ notification: Notification) {
        var customTip3 = notification.object as! String?
        tipControl.setTitle(customTip3, forSegmentAt: 2)
        UserDefaults.standard.setValue(customTip3, forKey: "tip3")
        if customTip3?.last == "%" {
            customTip3!.removeLast()
        }
        customTips.append((Double(customTip3!)!/100.0))
    }
    
    @objc func getNotification(_ notification: Notification) {
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
        
        var tipPercentages = [Double]()
        let bill = Double(billAmountTextField.text!) ?? 0
        print(customTips)
        if !customTips.isEmpty {
            tipPercentages = [customTips[0],customTips[1],customTips[2]]
        } else {
            tipPercentages = [0.15, 0.18, 0.2]
        }
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip

        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

}

