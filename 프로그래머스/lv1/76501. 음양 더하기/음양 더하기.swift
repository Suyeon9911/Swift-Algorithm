import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    
    var realNumArray: [Int] = []

    for i in 0..<signs.count {
        if signs[i] {
            realNumArray.append(absolutes[i])
        } else {
            realNumArray.append(-absolutes[i])
        }
    }
    return realNumArray.reduce(0,+)
}