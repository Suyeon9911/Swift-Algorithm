import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    
    var left = 1
    var right = 200000000
    
    while left < right {
        
        let mid = (left + right) / 2
        var isPass = true
        var jumpCount = 0
        
        for i in 0..<stones.count {
            if stones[i] - mid <= 0 {
                jumpCount += 1
            } else {
                jumpCount = 0
            }
            
            if jumpCount >= k {
                isPass = false
                break
            }
        }
        
        if isPass {
            left = mid + 1
        } else {
            right = mid
        }
    }
    
    return left
}