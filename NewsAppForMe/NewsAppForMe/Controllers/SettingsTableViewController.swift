//
//  SettingsTableViewController.swift
//  NewsAppForMe
//
//  Created by Jigneshkumar Patil on 2024/01/15.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    private var userDefaultViewModel = UserDefaultsViewModel()
    private var languagePref: String?
    @IBOutlet weak var usLangSwitch: UISwitch!
    @IBOutlet weak var caLangSwitch: UISwitch!
    @IBOutlet weak var darkModeEnableSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSwitches()
        // Do any additional setup after loading the view.
        languagePref = userDefaultViewModel.getString(forKey: "Language")
        print("languagePref: \(languagePref)")
    }
    

    private func setupSwitches() {
        usLangSwitch.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
        caLangSwitch.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
    }

    @objc func switchChanged(_ sender: UISwitch) {
        if sender == usLangSwitch {
            caLangSwitch.setOn(!usLangSwitch.isOn, animated: true)
            userDefaultViewModel.setLanguagePreference(to: "us")
        } else if sender == caLangSwitch {
            usLangSwitch.setOn(!caLangSwitch.isOn, animated: true)
            userDefaultViewModel.setLanguagePreference(to: "ca")
        }
    }

}

extension SettingsTableViewController: UserDefaultsServiceProtocol {
    
    // MARK: - App Setup
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - UserDefaults Setup
    func save(value: String, forKey key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func getValue(forKey key: String) -> String? {
        return UserDefaults.standard.string(forKey: key)
    }
    
//    private func setupLanguagePreference() {
//        userDefaultViewModel.setLanguagePreference(to: "us")
//        languagePref = userDefaultViewModel.getString(forKey: "Language")
//    }
    
}
