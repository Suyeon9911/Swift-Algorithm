import Foundation

func solution(_ s:String) -> Int {
    
    func checkCorrect(s: [String]) -> Bool {
        var stack: [String] = []
        
        for i in s {
            if stack.isEmpty {
                stack.append(i)
                continue
            }
            
            if i == "]" {
                if stack.last! == "[" {
                    stack.removeLast()
                }
            } else if i == ")" {
                if stack.last! == "(" {
                    stack.removeLast()
                }
            } else if i == "}" {
                if stack.last! == "{" {
                    stack.removeLast()
                }
            } else {
                stack.append(i)
            }
        }
        
        return stack.isEmpty ? true : false
    }
    
    var string = Array(s).map { String($0) }
    var count = 0
    
    for i in 0..<s.count {
        
        string.append(string.removeFirst())
        
        if checkCorrect(s: string) {
            count += 1
        }
    }
    
    
    return count
}