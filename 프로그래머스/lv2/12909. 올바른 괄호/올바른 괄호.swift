import Foundation

func solution(_ s:String) -> Bool
{
    var ans: Bool = false
    let stringArray = Array(s)
    
    var stack: [String] = []
    
    for i in 0..<stringArray.count {
        if stringArray[i] == "(" {
            stack.append("(")
        } else { // ) 일때 
            if !stack.isEmpty {
                if stack.last! == "(" {
                    stack.removeLast()
                } else {
                    stack.append(")")
                }
            } else {
                stack.append(")")
            }
        }
    }
    
    if stack.isEmpty {
        ans = true
    } else {
        ans = false
    }

    return ans
}