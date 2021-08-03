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
        self.title = "Tip Calculator"
        NotificationCenter.default.addObserver(self, selector: #selector(getNotification(_:)), name: Notification.Name("tappedSave"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setCustomTip1(_:)), name: Notification.Name("customTip1"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setCustomTip2(_:)), name: Notification.Name("customTip2"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setCustomTip3(_:)), name: Notification.Name("customTip3"), object: nil)
        
        tipControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue], for: .selected)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    @IBAction func calculateTip(_ sender: Any) {

        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip

        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @objc func setCustomTip1(_ notification: Notification) {
        var numSeg = 0
        while numSeg < 3 {
            let customTip = notification.object as! String?
            tipControl.setTitle(customTip, forSegmentAt: numSeg)
            numSeg += 1
        }
    }
    
    @objc func setCustomTip2(_ notification: Notification) {
        let customTip = notification.object as! String?
        tipControl.setTitle(customTip, forSegmentAt: 1)
    }
    
    @objc func setCustomTip3(_ notification: Notification) {
        let customTip = notification.object as! String?
        tipControl.setTitle(customTip, forSegmentAt: 2)
    }
    
    @objc func getNotification(_ notification: Notification) {
        let isDarkMode = UserDefaults.standard.bool(forKey: "tappedSave")
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
}

