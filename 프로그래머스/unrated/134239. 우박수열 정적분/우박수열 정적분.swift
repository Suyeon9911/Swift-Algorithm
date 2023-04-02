import Foundation

func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    
    // 1. 입력된 수가 짝수라면 2로 나누기
    // 2. 입력된 수가 홀수라면 3을 곱하고 1 더하기
    // 3. 결과로 나온 수가 1보다 크면 1번 반복
    
    // 일단 우박수열부터 구해 !
    var k = k
    var index = 1
    var numbers: [(Int,Int)] = [(0,k)]
    
    while k > 1 {
        if k % 2 == 0 {
            k = k / 2
            numbers.append((index,k))
        } else {
            k = k * 3 + 1
            numbers.append((index,k))
        }
        index += 1
    }
    
    var area: [Double] = []
    
    // print(numbers)
    
    for i in 0..<numbers.count-1 {
        let left = numbers[i].1
        let right = numbers[i+1].1
        var value: Double = 0
        
        if left < right {
            value = Double(left) + Double(right-left)/Double(2)
        } else {
            value = Double(right) + Double(left-right)/Double(2)
        }
        
        
        area.append(value)
    }
    
    // print(area)
    var result: [Double] = []
    
    for i in ranges {
        let start = i[0]
        let end = numbers.count-1 + i[1]
        
        if start == end {
            result.append(0.0)
        } else if start > end {
            // 유효하지 않은 구간에 대한 예외처리를 빼먹음
            result.append(-1.0)
        } else {
            result.append(Double(area[start..<end].reduce(0,+)))
        }
    }
    
    return result
}