//
//  SettingsViewController.swift
//  Prework
//
//  Created by Sarah Zheng on 7/11/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var mySwitch: UISwitch!
    
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
        } else {
            view.backgroundColor = .white
        }
    }

}
