import Foundation

let n = Int(readLine()!)!
    let array = readLine()!.components(separatedBy: " ").map { Int($0)! }

    var left: Int = 0
    var right: Int = n-1

    var minValue: Int = Int.max
    var result: [Int] = [0,0]

    // array는 오름차순으로 입력되므로 투포인터를 사용해서 합의 절댓값이 가장 작아야함.
    // 격차를 줄여나가기 위해, 더한 값이 음수가 나오면 left +1, 양수가 나오면 right-1
    while left < right {
        let newLiquid = array[left] + array[right]

        if minValue > abs(newLiquid) {
            minValue = abs(newLiquid)
            result[0] = array[left]
            result[1] = array[right]
        }

        if newLiquid > 0 {
            right -= 1
        } else if newLiquid < 0 {
            left += 1
        } else {
            // 0이면
            result[0] = array[left]
            result[1] = array[right]
            break
        }
    }

    print(result[0], result[1])