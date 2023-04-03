import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    
    var start = 0
    var end = start+k-1
    
    var newValue = 200000000
    
    while end < stones.count {
        
        var windowMax = stones[start...end].max()!
        newValue = min(newValue, windowMax)
        
        start += 1
        end += 1
    }
    
    return newValue
    
}