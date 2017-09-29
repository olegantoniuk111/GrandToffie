//
//  MilkySplash.swift
//  GrandToffie
//
//  Created by developer on 9/26/17.
//  Copyright © 2017 developer. All rights reserved.
//

import Foundation
class MilkySplash: NSObject{
    
    var producePlan : Int
    let name : String = "MilkySplash"
    let weightOnLine : Int = 1670
    let recyclableWastePercent: Double = 0.034
    let candyFillingPercent = 0.25
    let candyFillingWeight: Double
    let corpusWeight: Double
    let allowedRecyclableWaste : Double
    
    
    init(plan producePlan  : Int) {
        self.producePlan = producePlan;
        self.allowedRecyclableWaste = Double(producePlan) * recyclableWastePercent
        self.candyFillingWeight = Double(producePlan) * candyFillingPercent
        self.corpusWeight = Double(producePlan) - candyFillingWeight
        
        
    }
    
//    func calculateCandyWeightWithoutFilling (producedPallets pallets: Int, producedBoxes boxes : Int, producedRecyclableWaste recyclableWaste : Int ) -> Double{
//
//        let producedFakt = (pallets * 88 * 5) + recyclableWaste + (boxes * 5) + weightOnLine
//        let needToProduce = producePlan - producedFakt
//        print(needToProduce)
//        let filling = Double(needToProduce)*candyFillingPercent
//        print(filling)
//        let korpus = Double(needToProduce) - filling
//        print (korpus)
//        return korpus
//    }
    

    func calculateKorpusAndFillingWeight (producedPallets pallets: Int, producedBoxes boxes : Int, producedRecyclableWaste recyclableWaste : Int ) -> (korpus: Double, filling: Double){
        
        let producedFakt = (pallets * 88 * 5) + recyclableWaste + (boxes * 5) + weightOnLine
        let needToProduce = producePlan - producedFakt
        print(needToProduce)
        let filling = Double(needToProduce)*candyFillingPercent
        print(filling)
        let korpus = Double(needToProduce) - filling
        print (korpus)
        return (korpus, filling)
    }
    
}
