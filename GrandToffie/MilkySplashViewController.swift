//
//  MilkySplashViewController.swift
//  GrandToffie
//
//  Created by developer on 9/25/17.
//  Copyright © 2017 developer. All rights reserved.
//

import UIKit

class MilkySplashViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var plan: UILabel!
    @IBOutlet weak var waste: UILabel!
    @IBOutlet weak var korpus: UILabel!
    @IBOutlet weak var fillingPlan: UILabel!
    
    @IBOutlet weak var neededFilling: UILabel!
    @IBOutlet weak var producedBoxes: UITextField!
    
    @IBOutlet weak var producedPallets: UITextField!
    
    @IBOutlet weak var producedWaste: UITextField!
    
    @IBOutlet weak var neededWeightInKg: UILabel!
    @IBOutlet weak var neededWeightInPortion: UILabel!
    
    var milkySplash: MilkySplash?
    var kgOnPortion: String?
    
    @IBAction func calculateWeightKorpus(_ sender: UIButton) {
        var korpus: Double = 0
        var korpusInPortion: Double = 0
        var filling: Double = 0
        
        if let boxes = Int(producedBoxes.text!){
            if let pallets = Int(producedPallets.text!){
                if let waste = Int(producedWaste.text!){
                    let data =  (self.milkySplash?.calculateKorpusAndFillingWeight(producedPallets: pallets, producedBoxes: boxes, producedRecyclableWaste: waste))!
                    korpus = data.korpus
                    filling = data.filling
                    korpusInPortion = korpus/Double(kgOnPortion!)!
                    
                    
                }
            }
        }
        self.neededWeightInKg.text! = String(korpus)
        self.neededWeightInPortion.text! = String(korpusInPortion)
        self.neededFilling.text! = String(filling)
    }
//    @IBAction func calculateNeededProduction(_ sender: UIButton) {
//
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.plan.text! = String(milkySplash!.producePlan)
        self.name.text! = milkySplash!.name
        self.waste.text! = String(milkySplash!.allowedRecyclableWaste)
        self.korpus.text! = String(milkySplash!.corpusWeight)
        self.fillingPlan.text! = String(milkySplash!.candyFillingWeight)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
