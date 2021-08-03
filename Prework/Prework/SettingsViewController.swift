//
//  SettingsViewController.swift
//  Prework
//
//  Created by Sarah Zheng on 7/11/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var setDefaultTips: UILabel!
    @IBOutlet weak var tip1: UILabel!
    @IBOutlet weak var tip2: UILabel!
    @IBOutlet weak var tip3: UILabel!
    @IBOutlet weak var darkMode: UILabel!

    @IBOutlet weak var field1: UITextField!
    @IBOutlet weak var field2: UITextField!
    @IBOutlet weak var field3: UITextField!
    @IBAction func darkModeSwitch(_ sender: Any) {
        setDarkMode()
    }
    
    let myKeys = ["tip1","tip2","tip3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDarkMode()
        setupToolbar()
        for key in myKeys {
            let myTip = UserDefaults.standard.string(forKey: key)
            if key.compare("tip1").rawValue == 0 {
                field1.text = myTip
            } else if key.compare("tip2").rawValue == 0 {
                field2.text = myTip
            } else {
                field3.text = myTip
            }
        }
    }
    
    func setDarkMode() {
        if mySwitch.isOn {
            view.backgroundColor = .black
            setDefaultTips.textColor = .white
            tip1.textColor = .white
            tip2.textColor = .white
            tip3.textColor = .white
            darkMode.textColor = .white
        } else {
            view.backgroundColor = .white
            setDefaultTips.textColor = .black
            tip1.textColor = .black
            tip2.textColor = .black
            tip3.textColor = .black
            darkMode.textColor = .black
        }
    }
    
    @IBAction func setTips(_ sender: Any) {
        UserDefaults.standard.set(mySwitch.isOn, forKey: "switchMode")
        NotificationCenter.default.post(name: Notification.Name("switchMode"), object: nil)
        
        NotificationCenter.default.post(name: Notification.Name("customTip1"), object: field1.text)
        NotificationCenter.default.post(name: Notification.Name("customTip2"), object: field2.text)
        NotificationCenter.default.post(name: Notification.Name("customTip3"), object: field3.text)
    }

    func setupToolbar() {
        let bar = UIToolbar()
        let doneBotton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        bar.items = [flexSpace, flexSpace, doneBotton]
        bar.sizeToFit()
        field1.inputAccessoryView = bar
        field2.inputAccessoryView = bar
        field3.inputAccessoryView = bar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
