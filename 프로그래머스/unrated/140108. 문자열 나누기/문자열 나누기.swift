import Foundation

func solution(_ s:String) -> Int {

    var s = s.map { String($0) }
    var x = ""

    var xCount = 0
    var notXCount = 0

    var deletedStringCount = 0

    for i in s {
        if xCount == 0 {
            x = i
        }

        if i == x {
            xCount += 1
        } else {
            notXCount += 1
        }

        if xCount == notXCount {
            deletedStringCount += 1
            xCount = 0
            notXCount = 0
        }
    }

    // s 다 돌았는데 아직 남아있을 경우 마지막 문자 그대로 분해

    if xCount > 0 {
        deletedStringCount += 1
    }

    return deletedStringCount
}