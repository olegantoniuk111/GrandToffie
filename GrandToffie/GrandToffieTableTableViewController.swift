//
//  GrandToffieTableTableViewController.swift
//  GrandToffie
//
//  Created by developer on 9/17/17.
//  Copyright © 2017 developer. All rights reserved.
//

import UIKit

class GrandToffieTableViewController: UITableViewController, UITextInputTraits {
  
  
    @IBAction func button(_ sender: UIButton) {
        displaySlivkiAlert()
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
                let slivkiController = segue.destination as!
                SlivkiLenivkiViewController
                slivkiController.slivki = SlivkiLenivki(plan: num)
                slivkiController.kgOnPortion = self.kgOnPortionLabel.text
            }
        }
    }
    
    
    
    func displaySlivkiAlert(){
        let alert = UIAlertController(title: "Get Quantity For production", message: "Enter only digit", preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default, handler: {(_action: UIAlertAction) -> Void in
            if let textField1: String = alert.textFields![0].text {
                self.producePlanLabel.text = textField1
                if let textField2: String = alert.textFields![1].text{
                    self.kgOnPortionLabel.text = textField2
                }
                CATransaction.setCompletionBlock({
                    self.performSegue(withIdentifier: "slivkiLenivkiSegue", sender: nil)
                })
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








