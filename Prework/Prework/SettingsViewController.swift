//
//  SettingsViewController.swift
//  Prework
//
//  Created by Sarah Zheng on 7/11/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var darkModeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func setDarkMode(_ sender: UISwitch) {
        if sender.isOn {
            sender.setOn(false, animated: true)
            view.backgroundColor = .black
        } else {
            sender.setOn(true, animated: true)
            view.backgroundColor = .white
        }
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    }

}
