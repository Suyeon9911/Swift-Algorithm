import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    
    var answer = Array(repeating: -1, count: numbers.count)
    var backMax = numbers.last!
    
    for i in stride(from: numbers.count-2, to: -1, by: -1) {
        if numbers[i] >= backMax {
            backMax = numbers[i]
            continue
        }
        
        for j in i+1..<numbers.count {
            if numbers[j] > numbers[i] {
                answer[i] = numbers[j]
                break    
            }
            
            if numbers[i] >= numbers[j] && numbers[i] < answer[j] {
                answer[i] = answer[j]
                break
            }
        }
    }
    return answer
}