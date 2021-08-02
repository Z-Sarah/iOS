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
    
    @IBAction func darkModeSwitch(_ sender: Any) {
        setDarkMode()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setDarkMode()
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

}
