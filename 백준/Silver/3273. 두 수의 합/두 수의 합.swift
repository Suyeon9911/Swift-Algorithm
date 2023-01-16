// 투포인터
import Foundation

let n = Int(readLine()!)!
let numbers = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted()
let target = Int(readLine()!)!

var count = 0
var start = 0
var end = n-1

// 정렬된 배열. 3 4 6 9 10 이라고 치면 10을 찾고 싶은데 
// 첫 + 끝 13 -> 더 크니까 end하나를 줄인다.
// 3 + 9 = 12
// 3 + 6 = 9 -> 더 작으니까 start를 올린다.
// 4 + 6 = 10이 됨.

while start < end {
    let a = numbers[start]
    let b = numbers[end]
    
    if target == a + b {
        start += 1
        end -= 1
        count += 1
    } else if target < a + b {
        end -= 1
    } else {
        start += 1
    }
    
}

print(count)

