import Foundation

func solution(_ numbers:[Int]) -> [Int] {

    var result: [Int] = []

    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            var sum = numbers[i] + numbers[j]
            if result.contains(sum) == false {
                result.append(sum)
            }
        }
    }


    result.sort()
    return result
}