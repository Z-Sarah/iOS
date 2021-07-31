//
//  SettingsViewController.swift
//  Prework
//
//  Created by Sarah Zheng on 7/11/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
//    lazy var darkModeSwitch: UISwitch = {
//        let darkModeSwitch = UISwitch()
//        darkModeSwitch.tintColor = .green
//        darkModeSwitch.onTintColor = .green
//        darkModeSwitch.backgroundColor = .black
//        return darkModeSwitch
//    }()
    @IBOutlet var mySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        view.backgroundColor = .white
//        view.addSubview(darkModeSwitch)
    }
    
    @IBAction func setDarkMode(_ sender: UISwitch) {
        if sender.isOn {
            view.backgroundColor = .red
        } else {
            view.backgroundColor = .blue
        }
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//        if segue.identifier == "SettingsViewController",
//           let destVC = segue.destination as? SettingsViewController {
//            setDarkMode(destVC)}
//    }

}
