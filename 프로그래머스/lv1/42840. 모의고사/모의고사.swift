import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let first: [Int] = [1,2,3,4,5]
    let second: [Int] = [2,1,2,3,2,4,2,5]
    let third: [Int] = [3,3,1,1,2,2,4,4,5,5]

    var count: [Int] = [0,0,0]

    for i in 0..<answers.count {
        if answers[i] == first[i % 5] {
            count[0] += 1
        }

        if answers[i] == second[i % 8] {
            count[1] += 1
        }

        if answers[i] == third[i % 10] {
            count[2] += 1
        }
    }

    var result: [Int] = []
    let max = count.max()!

    for i in 0..<count.count {
        if count[i] == max {
            result.append(i+1)
        }
    }

    return result.sorted()
}