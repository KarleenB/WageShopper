//
//  ViewController.swift
//  WageShopper
//
//  Created by Branden Karleen on 9/21/21.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var wageTxt: CurrencyTextField!
    @IBOutlet weak var priceTxt: CurrencyTextField!
    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var hourLbl: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calcBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calcBtn.backgroundColor = UIColor.orange
        calcBtn.setTitle("Calculate", for: .normal)
        calcBtn.setTitleColor(UIColor.white, for: .normal)
        calcBtn.addTarget(self, action: #selector(MainVC.calculate), for: .touchUpInside)
        
        numberLbl.isHidden = true
        hourLbl.isHidden = true
        
        //Add calcbutton to top of keyboard when it appears on screen from clicking in textField
        wageTxt.inputAccessoryView = calcBtn
        priceTxt.inputAccessoryView = calcBtn
    }
    
    @objc func calculate() {
        if let wageInput = wageTxt.text, let priceInput = priceTxt.text {
            if let wage = Double(wageInput), let price = Double(priceInput) {
                view.endEditing(true)
                numberLbl.isHidden = false
                hourLbl.isHidden = false
                numberLbl.text = "\(Wage.getHours(forWage: wage, andPrice: price))"
            }
        }
    }
    
    @IBAction func clearCalcBtn(_ sender: Any) {
        numberLbl.isHidden = true
        hourLbl.isHidden = true
        wageTxt.text = ""
        priceTxt.text = ""
    }
    
}

