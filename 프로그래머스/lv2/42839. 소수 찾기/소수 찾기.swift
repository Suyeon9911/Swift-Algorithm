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
    var visited: [Bool] = []
    var numSet: Set<Int> = []
    
    func permutation(_ numArr: [String], count: Int, rCount: Int) {
        if count == rCount {
            numSet.insert(Int(numArr.joined())!)
            return
        }
        
        for (i, n) in nums.enumerated() {
            if visited[i] {
                continue
            }
            
            var newNumArr = numArr
            newNumArr.append(n)
            
            visited[i] = true
            permutation(newNumArr, count: count+1, rCount: rCount)
            visited[i] = false
        }
    }
    
    for i in 1...nums.count {
        visited = Array(repeating: false, count: nums.count)
        
        permutation([], count: 0, rCount: i)
    }
        
    return numSet.filter { isPrime($0) }.count
}
