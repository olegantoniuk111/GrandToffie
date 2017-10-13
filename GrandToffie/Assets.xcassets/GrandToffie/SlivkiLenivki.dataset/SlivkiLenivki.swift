
import Foundation



class SlivkiLenivki : NSObject{
    
    
    let name : String = "Slivki Lenivki"
    let weightOnLine : Int = 1530
    let recyclableWastePercent: Double = 0.027
    let producePlan : Int
    
    let allowedRecyclableWaste : Double
    
    
    init(plan producePlan  : Int) {
        self.producePlan = producePlan;
        self.allowedRecyclableWaste = Double(producePlan) * recyclableWastePercent
    }
    
    func calculateShiftData (producedPallets pallets: Int, producedBoxes boxes : Int, producedRecyclableWaste recyclableWaste : Int ) -> Double{
        let producedWeight = (pallets * 88 * 5) + recyclableWaste + (boxes * 5) + weightOnLine
        let neededWeigt = Double(self.producePlan - producedWeight )
        return neededWeigt
    }
    
}

