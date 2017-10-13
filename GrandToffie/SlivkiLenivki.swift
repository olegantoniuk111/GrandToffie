
import Foundation



class SlivkiLenivki : NSObject{
    
    
    let name : String = "Slivki Lenivki"
    let weightOnLine : Int = 1530
    let recyclableWastePercent: Double = 0.027
    let producePlan : Int
    
    let waste : Double
    
    let allWeight : Int
    
    
    init(plan planForProduction  : Int) {
        self.producePlan = planForProduction;
        self.waste = Double(planForProduction) * recyclableWastePercent
        self.allWeight = producePlan + Int(waste)
    }
    
    func calculateShiftData (producedPallets pallets: Int, producedBoxes boxes : Int, producedRecyclableWaste recyclableWaste : Int ) -> Int{
        let producedWeight = (pallets * 88 * 5) + recyclableWaste + (boxes * 5) + weightOnLine
        let neededWeigt = self.allWeight - producedWeight
        return neededWeigt
    }
    
}

