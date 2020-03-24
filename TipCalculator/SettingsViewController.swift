//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by apple on 21/03/2020.
//

import UIKit

class SettingsViewController: UIViewController{


    let defaults = UserDefaults.standard
    
    @IBOutlet weak var tipSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tipSegment.selectedSegmentIndex = defaults.integer(forKey: "defaultIndex")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func OnDefaultChange(_ sender: Any) {
        defaults.set(tipSegment.selectedSegmentIndex, forKey: "defaultIndex")
        defaults.synchronize()
    }
    
    

}
