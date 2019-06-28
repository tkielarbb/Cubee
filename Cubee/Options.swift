//
//  Options.swift
//  Cubee
//
//  Created by Tomasz Kielar on 27/06/2019.
//  Copyright © 2019 Tomasz Kielar. All rights reserved.
//

import UIKit

class Options : UIViewController {
    
    //Variables and Constants
    let defaults = UserDefaults.standard
    
    //Outlets
    @IBOutlet weak var nickTextfield: UITextField!
    @IBOutlet weak var avgSegmentedControll: UISegmentedControl!
    @IBOutlet weak var themeSegmentedControll: UISegmentedControl!
    @IBOutlet weak var submitButton: UIButton!
    
    //View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
        setThemeSegmented()
        setAvgSegmented()
    }
    
    //Actions
    @IBAction func nickChanged(_ sender: Any) {
        let newNick = nickTextfield.text
        defaults.set(newNick, forKey: "nick")
    }
    
    @IBAction func avgControllValueChanged(_ sender: UISegmentedControl) {
        let selectedSegment = sender.selectedSegmentIndex
        let selectedOption = sender.titleForSegment(at: selectedSegment)
        var newOption = ""
        
        switch selectedOption {
        case "5 results":
            newOption = "5"
        case "10 results":
            newOption = "10"
        case "15 results":
            newOption = "15"
        case "20 results":
            newOption = "20"
        default:
            print("Error: You dont have other choices")
        }
        
        defaults.set(newOption, forKey: "count")
    }
    
    @IBAction func themeControllValueChanged(_ sender: UISegmentedControl) {
        let selectedSegment = sender.selectedSegmentIndex
        let selectedOption = sender.titleForSegment(at: selectedSegment)
        var newOption = String()
        
        if selectedOption == "Light mode" {
            newOption = "light"
        } else {
            newOption = "dark"
        }
        
        
        defaults.set(newOption, forKey: "theme")
        
        updateUI()
        updateNavUI()
    }
    
    @IBAction func submitAction(_ sender: UIButton) {
        let newNick = nickTextfield.text
        defaults.set(newNick, forKey: "nick")
    }
    
    //Functions
    func setThemeSegmented() {
        let savedData = defaults.string(forKey: "theme")
        if savedData == "light" {
            themeSegmentedControll.selectedSegmentIndex = 0
        } else {
            themeSegmentedControll.selectedSegmentIndex = 1
        }
    }
    
    func setAvgSegmented() {
        let savedData = defaults.string(forKey: "count")
        switch savedData {
        case "5":
            avgSegmentedControll.selectedSegmentIndex = 0
        case "10":
            avgSegmentedControll.selectedSegmentIndex = 1
        case "15":
            avgSegmentedControll.selectedSegmentIndex = 2
        case "20":
            avgSegmentedControll.selectedSegmentIndex = 3
        default:
            print("Error: You dont have other choices")
        }
    }
}
