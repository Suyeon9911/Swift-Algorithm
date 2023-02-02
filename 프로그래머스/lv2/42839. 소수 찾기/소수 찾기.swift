import Foundation


func isPrime(_ num: Int) -> Bool {
    if num < 4 {
        return (num <= 1) ? false : true
    } else {
        for i in 2...Int(sqrt(Double(num))) {
            if num % i == 0 {
                return false
            }
        }
    }
    
    return true
}

func solution(_ numbers:String) -> Int {
    
    let nums: [String] = numbers.map { String($0) }
    var visited: [Bool] = Array(repeating: false, count: nums.count)
    // 중복 제거를 위해 Set 자료형 사용
    var numSet: Set<Int> = []
    
    func permutation(_ numArray: [String],_ rCount: Int) {
        // numArray로 가능한 경우의 수 생각하기 : 순열 활용 -> 순서를 고려하여 조합 만들기. 
        if numArray.count == rCount {
            // 빈 배열에서 시작해서 rCount 만큼 순열을 만들어 냈을 때 set에 insert
            numSet.insert(Int(numArray.joined())!)
            return // 재귀 탈출
        }
        
        for (i, n) in nums.enumerated() {
            // 처음에 주어진 number 배열을 탐색 
            if visited[i] {
                continue // 이미 사용했다면 다음 element로
            } else {
                visited[i] = true
                permutation(numArray+[n], rCount)
                // 함수 return 이후 방문 처리를 다시 false로 돌려주기
                visited[i] = false
            }
        }
    }
    
    for i in 1...nums.count {
        // 1자리수부터 nums.count 수 자리까지 다 구해야함. 
        permutation([], i)
    }
    
    return numSet.filter { isPrime($0) }.count
}
