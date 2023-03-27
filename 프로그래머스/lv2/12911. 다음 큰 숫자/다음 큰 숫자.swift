import Foundation

func solution(_ n: Int) -> Int {
    
    var answer: Int = n + 1
    
    while true {
        if n.nonzeroBitCount == answer.nonzeroBitCount {
            break;
        }
        answer += 1
    }
    
    return answer 
}