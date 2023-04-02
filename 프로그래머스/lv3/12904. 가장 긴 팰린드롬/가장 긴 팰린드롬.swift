import Foundation

func solution(_ s:String) -> Int {
    
    let arr: [Character] = Array(s)
    var answer = 0

    for i in 0..<arr.count {
        for j in stride(from: arr.count - i, to: answer, by: -1) {
            var left = i
            var right = i + j - 1
            
            while left <= right, arr[left] == arr[right] {
                left += 1
                right -= 1
            }

            if left > right { answer = max(answer, j) }
        }
    }
    

    return answer
}