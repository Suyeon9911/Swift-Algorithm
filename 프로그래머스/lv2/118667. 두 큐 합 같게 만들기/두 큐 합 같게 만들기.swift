import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    var sum1 = queue1.reduce(0,+)
    var sum2 = queue2.reduce(0,+)

    let sum = sum1 + sum2

    let target = sum / 2

    var queue = queue1 + queue2

    var moveCount = 0

    var pointer1 = 0
    var pointer2 = queue1.count
    
    if sum % 2 != 0 {
        return -1
    }

    while sum1 != target {
        
        if pointer2 >= queue.count || pointer1 >= pointer2 {
            return -1
        }

        let popNum1 = queue[pointer1]
        let popNum2 = queue[pointer2]

        if sum1 < sum2 {
            pointer2 += 1
            sum1 += popNum2
            sum2 -= popNum2
        } else {
            pointer1 += 1
            sum1 -= popNum1
            sum2 += popNum1
        }
        
        moveCount += 1
    }

    return moveCount
}