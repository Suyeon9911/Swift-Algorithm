import Foundation

func solution(_ n:Int) -> Int {
    var count = 0
    
    for i in 1...n {
        count += isPrime(num: i) ? 1 : 0
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