import Foundation

func solution(_ storey:Int) -> Int {
    
    var stone: Int = 0

    var storey = String(storey).map { Int(String($0))! }
    
    for i in stride(from: storey.count-1, to: -1, by: -1) {
        if storey[i] < 5 {
            stone += storey[i]
        } else if storey[i] == 5 {
            if i == 0 {
                stone += storey[i]
                break    
            }
            
            if storey[i-1] < 5 {
                stone += storey[i]
            } else {
                stone += storey[i]
                storey[i-1] += 1
            }
        } else {
            stone += (10-storey[i])
            
            if i != 0 {
                storey[i-1] += 1
            } else {
                stone += 1
            }
            
            print(storey)
        }
    }
    
    return stone
}