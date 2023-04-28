import Foundation

// 균형잡힌 괄호 문자열의 인덱스를 반환하는 함수

func balanced(_ string: String) -> Int {
    
    var count = 0 // 왼쪽 괄호의 개수 
    let string = Array(string)
    
    for i in 0..<string.count {
        if string[i] == "(" {
            count += 1
        } else {
            count -= 1
        }
        
        if count == 0 {
            return i
        }
    }
    
    return 0
}

// 올바른 괄호 문자열인지 판단하는 함수 

func check(_ string: [String]) -> Bool {
    var count = 0 // 왼쪽 괄호의 개수
    for i in string {
        if i == "(" {
            count += 1
        } else {
            if count == 0 {
                // 쌍이 맞지 않는 경우에 false
                return false
            }
            count -= 1
        }
    }
    
    return true
}

func solution(_ p:String) -> String {
    
    var answer = ""
    
    // 1. p가 빈 문자열일 경우, 빈 문자열 반환
    if p == "" {
        return answer
    }
    
    // 2. 균형잡힌 괄호 문자열로 분리하기 -> 인덱스 구해서 u,v로
    var index = balanced(p)
    let p = Array(p)
    var u = p[0..<index+1].map { String($0) }
    var v = p[(index+1)...].map { String($0) }
    
    // 3. 만약 올바른 괄호 문자열이면 v에 대해 함수를 수행한 결과를 붙여서 반환한다.
    if check(u) {
        answer = u.joined() + solution(v.joined())
    } else {
        // 4. 올바른 괄호 문자열이 아니라면 4번대로 수행
        answer = "("
        answer += solution(v.joined())
        answer += ")"
        
        u.removeLast()
        u.removeFirst()
        
        for i in 0..<u.count {
            if u[i] == "(" {
                u[i] = ")"
            } else {
                u[i] = "("
            }
        }
        answer += u.joined()
    }
    
    return answer
}