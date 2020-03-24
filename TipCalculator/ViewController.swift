//
//  ViewController.swift
//  TipCalculator
//
//  Created by Yasvi Patel on 20/03/2020.
//  Copyright © 2020 Yasvi Patel. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billAmountField: UITextField!
    
    @IBOutlet weak var tipSegment: UISegmentedControl!
    
  
    let defaults = UserDefaults.standard
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tipSegment.selectedSegmentIndex = defaults.integer(forKey: "defaultIndex")
        
        billAmountField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipSegment.selectedSegmentIndex = defaults.integer(forKey: "defaultIndex")
        calculateTipfunc()
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        calculateTipfunc()
    }
    
    func calculateTipfunc(){
        //Get the Bill Amount
        let bill = Double(billAmountField.text!) ?? 0
        
        //Calculate Tip and Total
        let tipPercentage = [0.1, 0.15, 0.2]
        let tip = bill * tipPercentage[tipSegment.selectedSegmentIndex]
        let total = bill + tip
        
        //Display Tip and Total
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format : "$%.2f", total)
    }
    
}

