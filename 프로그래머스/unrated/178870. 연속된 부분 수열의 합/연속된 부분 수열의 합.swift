import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    
    // 투포인터 : 정렬된 수열이 주어졌기 때문
    
    var sum = sequence[0]
    var start = 0
    var end = 0 
    
    var answer = [(Int,Int,Int)]()
    
    while start < sequence.count && end < sequence.count {
        if sum == k {
            answer.append((start,end, end-start+1))
        }
        
        if sum <= k {
            end += 1
            if end == sequence.count { break }
            sum += sequence[end]
        } else {
            sum -= sequence[start]
            start += 1
        }
    }
    
    answer = answer.sorted(by: { $0.2 < $1.2 })
    
    return [answer[0].0, answer[0].1]
}