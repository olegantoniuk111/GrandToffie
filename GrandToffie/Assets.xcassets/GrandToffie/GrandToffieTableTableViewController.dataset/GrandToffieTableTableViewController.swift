//
//  GrandToffieTableTableViewController.swift
//  GrandToffie
//
//  Created by developer on 9/17/17.
//  Copyright © 2017 developer. All rights reserved.
//

import UIKit

class GrandToffieTableViewController: UITableViewController, UITextInputTraits {
  
    @IBAction func calcMilkySplash(_ milkySplashSender: UIButton) {
        displayAlertControllerForProductionQuantityInput(milkySplashSender)
    }
    @IBAction func calcSlivki(_ slivkiLenivkiSender: UIButton) {
        displayAlertControllerForProductionQuantityInput(slivkiLenivkiSender)
    }
    @IBOutlet weak var producePlanLabel: UILabel!
    @IBOutlet weak var kgOnPortionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let num = Int(self.producePlanLabel.text!){
            
            if segue.identifier == "slivkiLenivkiSegue"{
               if let slivkiController = segue.destination as?
                SlivkiLenivkiViewController{
                slivkiController.slivki = SlivkiLenivki(plan: num)
                slivkiController.kgOnPortion = self.kgOnPortionLabel.text
                }
            }else if segue.identifier == "milkySplashSegue"{
                if let milkySplashController = segue.destination as? MilkySplashViewController{
                    milkySplashController.milkySplash = MilkySplash(plan: num)
                    milkySplashController.kgOnPortion = self.kgOnPortionLabel.text
                }
            }
        }
    }
    
    func displayWrongInputDataAlert(_ wrongInputSender: UIButton){
        let alert = UIAlertController(title: "Only Decimal Number", message: "It must be only digit", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.displayAlertControllerForProductionQuantityInput(wrongInputSender)
        }
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    func performCATransaction(_ buttonTittle: String){
        CATransaction.setCompletionBlock({
            self.performSegue(withIdentifier: buttonTittle, sender: nil)
        })
        
    }
    
    
    func displayAlertControllerForProductionQuantityInput(_ sender: UIButton){
        let alert = UIAlertController(title: "Get Quantity For production", message: "Enter quantity for production", preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default, handler: {(_action: UIAlertAction) -> Void in
            if let produceQuantity: Int = Int(alert.textFields![0].text!){
                self.producePlanLabel.text = String(produceQuantity)
                 }
                else {self.displayWrongInputDataAlert(sender)}
                if let textField2: Int = Int(alert.textFields![1].text!){
                    self.kgOnPortionLabel.text = String(textField2)
               }
                else {self.displayWrongInputDataAlert(sender)}
            
            let buttonTittle: String = sender.currentTitle!
            
            switch buttonTittle {
            case "calcSlivki": self.performCATransaction("slivkiLenivkiSegue")
            case "calcMilkySplash" : self.performCATransaction("milkySplashSegue")
            default : break
            }
    
            })
        alert.addAction(ok)
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
     
        alert.addTextField { (textField) in
            textField.keyboardType = UIKeyboardType.decimalPad
            textField.placeholder = "inputQuantityForProduction"
        }
        alert.addTextField { (textField) in
            textField.keyboardType = .decimalPad
            textField.placeholder = "kgOnPortion"
        }
            self.present(alert, animated: true, completion: nil)
        
    }
}
