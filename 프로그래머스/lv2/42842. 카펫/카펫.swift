import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    
    var row = 0
    var col = 0 
    
    // 무조건 행이 더 짤음 
    
    for i in 1...yellow {
        if yellow % i == 0 {
            row = i + 2
            col = (yellow / i) + 2
            
            
            if ((row * col) - yellow) == brown {
                break
            } else {
                continue
            }
            
        } else {
            continue
        }
    }
    
    return [col, row]
}