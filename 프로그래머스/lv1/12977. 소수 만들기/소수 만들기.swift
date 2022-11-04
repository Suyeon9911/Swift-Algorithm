import Foundation

func solution(_ nums:[Int]) -> Int {
    var count = 0
    
    for i in 0..<nums.count {
        for j in i+1..<nums.count {
            for k in j+1..<nums.count {
                let number = nums[i] + nums[j] + nums[k]
                if isPrime(num: number) {
                    count += 1
                }
            }
        }
    }
    return count
}

func isPrime(num: Int) -> Bool {
    if (num < 4) {
        return num == 1 ? false : true
    }
    
    for i in 2...Int(sqrt(Double(num))) {
        if (num % i == 0) { return false }
    }
    return true
}

// 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31,… 등은 모두 소수
// 소수가 아닌 자연수는 합성수
// 1은 소수도 합성수도 아니다. 