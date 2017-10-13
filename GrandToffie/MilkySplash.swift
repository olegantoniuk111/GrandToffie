
import Foundation
class MilkySplash: NSObject{
    
    var producePlan : Int
    let name : String = "MilkySplash"
    let weightOnLine : Int = 1670
    
    let candyFillingPercent = 0.25
    let candyFillingWeight: Double
    let corpusWeight: Double
    
    let recyclableWastePercent: Double = 0.034
    let waste : Double
    
    let allWeight : Int
    
    
    init(plan planForProduction  : Int) {
        self.producePlan = planForProduction;
        self.waste = Double(planForProduction) * recyclableWastePercent
        self.allWeight = producePlan + Int(waste)
        self.candyFillingWeight = Double(allWeight) * candyFillingPercent
        self.corpusWeight = Double(allWeight) - candyFillingWeight
        
    }
    
    func calculateNeededKorpusAndFillingWeight (producedPallets pallets: Int, producedBoxes boxes : Int, producedRecyclableWaste recyclableWaste : Int ) -> (korpus: Double, filling: Double){
        
        let producedFakt = (pallets * 88 * 5) + recyclableWaste + (boxes * 5) + weightOnLine
        let needToProduce = allWeight - producedFakt
        let filling = Double(needToProduce)*candyFillingPercent
        let korpus = Double(needToProduce) - filling
        return (korpus, filling)
    }
    
}
