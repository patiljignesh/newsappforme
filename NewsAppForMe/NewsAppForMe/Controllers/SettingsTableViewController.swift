//
//  SettingsTableViewController.swift
//  NewsAppForMe
//
//  Created by Jigneshkumar Patil on 2024/01/15.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    
    @IBOutlet weak var usLangSwitch: UISwitch!
    @IBOutlet weak var caLangSwitch: UISwitch!
    @IBOutlet weak var darkModeEnableSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSwitches()
        // Do any additional setup after loading the view.
    }
    

    private func setupSwitches() {
        usLangSwitch.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
        caLangSwitch.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
    }

    @objc func switchChanged(_ sender: UISwitch) {
        if sender == usLangSwitch {
            caLangSwitch.setOn(!usLangSwitch.isOn, animated: true)
        } else if sender == caLangSwitch {
            usLangSwitch.setOn(!caLangSwitch.isOn, animated: true)
        }
    }

}
