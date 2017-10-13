//
//  SlivkiLenivkiViewController.swift
//  GrandToffie
//
//  Created by developer on 9/16/17.
//  Copyright © 2017 developer. All rights reserved.
//

import UIKit

class SlivkiLenivkiViewController: UIViewController {
   
    @IBOutlet weak var name: UILabel!
   
    @IBOutlet weak var plan: UILabel!
    
    @IBOutlet weak var waste: UILabel!
    
    
    @IBOutlet weak var producedBoxes: UITextField!
    @IBOutlet weak var producedPallets: UITextField!
    @IBOutlet weak var producedWaste: UITextField!
    
    @IBOutlet weak var must_made: UILabel!
    
    @IBOutlet weak var must_made_portion: UILabel!
    var slivki : SlivkiLenivki?
    var kgOnPortion: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = slivki?.name
        plan.text = String(describing: slivki!.producePlan)
        waste.text = String(describing: slivki!.allowedRecyclableWaste)
        
    }
    @IBAction func calculate() {
    
        var mustMadeInKg : Double = 0
        var mustMadeInPortion : Double = 0
        if let boxes = Int(producedBoxes.text!){
            if let pallets = Int(producedPallets.text!){
                if let waste = Int(producedWaste.text!){
                    mustMadeInKg =  (slivki?.calculateShiftData(producedPallets: pallets, producedBoxes: boxes, producedRecyclableWaste: waste))!
                    mustMadeInPortion = Double(mustMadeInKg)/Double(kgOnPortion!)!
                    print (mustMadeInKg)
                }
            }
        }
        must_made.text! = String(mustMadeInKg)
        must_made_portion!.text = String(mustMadeInPortion)

    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}
