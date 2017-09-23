
import Foundation



class SlivkiLenivki : NSObject{
    
    
    let name : String = "Slivki Lenivki"
    let weightOnLine : Int = 1700
    let productionLossesPercent: Double = 0.008
    let recyclableWastePercent: Double = 0.027
    var producePlan : Int
    
    var allowedRecyclableWaste : Double?
    
    
    init(plan producePlan  : Int) {
        self.producePlan = producePlan;
        self.allowedRecyclableWaste = Double(producePlan) * recyclableWastePercent
    }
    
    func calculateShiftData (producedPallets pallets: Int, producedBoxes boxes : Int, producedRecyclableWaste recyclableWaste : Int ) -> Double{
        let producedWeight = (pallets * 88 * 5) + recyclableWaste + (boxes * 5) + weightOnLine
        let neededWeigt = Double(self.producePlan - producedWeight )
        let rezult = neededWeigt + (neededWeigt * productionLossesPercent)
        return rezult
    }
    
}

