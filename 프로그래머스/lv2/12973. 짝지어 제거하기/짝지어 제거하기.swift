import Foundation

func solution(_ s:String) -> Int {
    
    var stack: [Character] = []
    var removedCount = 0
    
    for i in s {
        
        if stack.isEmpty {
            stack.append(i)
            continue
        }
        
        let last = stack.last
        
        if last == i {
            stack.removeLast(1)
            removedCount += 2
            continue
        } else {
            stack.append(i)
            continue
        }
    }
    
    var answer = 0 
    
    if stack.isEmpty {
        if removedCount == s.count {
            answer = 1
        }
    }
    
    return answer
}