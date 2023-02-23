import Foundation

func solution(_ number:String, _ k:Int) -> String {
    // 기본 아이디어 : 앞에서부터 순차적으로 탐색할때, 앞에있는 숫자가 뒤에있는 숫자보다 작다면 앞에 있는 숫자 지워주기. 1924 -> 1과 9가 있을 때 1을 지워줘야 9로 시작하는 더 큰 수를 만들수 있기 때문.
    
    
    let numArray: [String] = number.map { String($0) }
    var stack: [String] = [] // 스택으로 해결해야 시간초과 안남.
    var count = 0 // 제거해줘야하는 숫자의 개수를 세는 변수
    
    // 스택 6342 -> 처음에 6 넣음. -> 6이 3보다 크니가 63 -> 3이 4보다 작으므로 3 제거 -> 6과 4를 비교해서 64  
    
    for i in 0..<numArray.count {
        
        while count < k && !stack.isEmpty && stack.last! < numArray[i] {
            stack.removeLast()
            count += 1
        }
        
        
        if count >= k {
            // 이미 앞에서 삭제한 수가 k를 넘는다면. 
            stack += Array(numArray[i...])
            break
        } else {
            // 스택이 비어있다면 계속 추가
            stack.append(numArray[i])
        }
    }

    return String(stack.joined().prefix(number.count-k))
}