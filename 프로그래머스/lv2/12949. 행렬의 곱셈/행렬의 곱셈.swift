import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    
    var answer: [[Int]] = []
    
    for i in 0..<arr1.count {
        
        answer.append([])
        
        for j in 0..<arr2[0].count {
            // 열
            var sum = 0
            
            for k in 0..<arr2.count {
                // k는 행 
                sum += arr1[i][k] * arr2[k][j]
                
            }
            answer[i].append(sum)
        }
    }
    
    return answer
}