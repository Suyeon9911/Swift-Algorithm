import Foundation

func solution(_ ingredient:[Int]) -> Int {
    
    var count = 0
    var stack: [String] = []
    
    for i in ingredient {
        stack.append(String(i))
        
        if stack.count >= 4 {  
            if stack.suffix(4).joined() == "1231" {
                stack.removeLast(4)
                count += 1
            }
        }
    }
    
    return count
}