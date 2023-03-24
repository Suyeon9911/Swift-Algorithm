import Foundation

// 3:13
func solution(_ expression:String) -> Int64 {
    // + - * 연산 수식 -> 우선순위 재정의, 가장 큰 숫자 제출, 동일한 우선순위안됨.
    // 음수일 경우 절댓값으로. 
    // 숫자만 따로 저장
    
    let fixNumbers = expression.components(separatedBy: ["-","*","+"]).map { Int($0)! }
    let fixCompute = Array(expression).filter { ["-","*","+"].contains($0) }.map { String($0) }
    
    var numbers = fixNumbers
    var compute = fixCompute
    
    // print(numbers)
    // print(compute)
    
    let priority = [["-","*","+"], ["-","+","*"], ["*","-","+"], ["*","+","-"], ["+","*","-"], ["+","-","*"]]
    
    func calculate(computeChar: String) {
        
        while compute.contains(computeChar) {
            let index = compute.firstIndex(of: computeChar)!
            let num1 = numbers[index]
            let num2 = numbers[index+1]
            
            var value = 0
            
            switch computeChar {
                case "*":
                    value = num1 * num2
                case "+":
                    value = num1 + num2
                case "-":
                    value = num1 - num2
                default:
                    value = 0
            }
            
            numbers[index] = Int(value)
            numbers.remove(at: index+1)
            compute.remove(at: index)
        }
    }
    
    var resultArray = [Int]()
    
    for i in priority {
    
        // 계산 다하면 초기화
        numbers = fixNumbers
        compute = fixCompute
        
        for j in i {
            calculate(computeChar: j)
        }
        
        resultArray.append(abs(numbers[0]))
    }
    
    return Int64(resultArray.max()!)
}