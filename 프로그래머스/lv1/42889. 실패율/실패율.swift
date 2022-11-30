import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var failRatio = [Int: Double]()
    var totalPlayer = Double(stages.count)
    var countingArray = Array(repeating: 0, count: N+2) // 각 단계별 도달한 사람 수 ?

    for num in stages {
        countingArray[num] += 1 // 인덱스에 맞게 넣어주면 되니까 굳이 딕셔너리로 안다뤄도 됨.
    }

    for i in 1..<N+1 {
        if countingArray[i] == 0 {
            // 각 단계에서 도달한 사람이 없다면
            failRatio[i] = 0.0 // 실패율은 0
        } else {
            failRatio[i] = Double(countingArray[i]) / totalPlayer 
            totalPlayer = totalPlayer - Double(countingArray[i])
            // 전체에서 단계별로 빼면 그 단계까지 도달한 사람의 명수가 나옴
        }
    }

    let sortedArray = failRatio.sorted(by: <).sorted(by: { $0.1 > $1.1 })
    let result = sortedArray.map { $0.key }

    return result
}