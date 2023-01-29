import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    // 완전 탐색 : 금액 계산 
    var price = 0
    var count = 0
    var countArray: [Int] = []
    
    var d = d.sorted()
    
    for i in d {
        if price + i <= budget {
            price += i
            count += 1
        } else {
            break
        }
    }
    
    return count
}