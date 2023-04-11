import Foundation

func solution(_ numbers:[Int]) -> [Int] {

    var answer = Array(repeating: -1, count: numbers.count) 
    var stack: [(Int, Int)] = [(0, numbers[0])]
    var result: [Int] = []
    
    for i in 1..<numbers.count {
        // stack이 비면 종료
        while !stack.isEmpty {
            // stack의 마지막 값이 기준값보다 크면 break
            if stack.last!.1 >= numbers[i] { break }
            // stack의 마지막원소를 지우고 해당 인덱스에 큰 수 할당
            answer[stack.removeLast().0] = numbers[i]
        }
        // stack에 현재 기준값 저장
        stack.append((i, numbers[i]))
    }
    
    return answer
}