import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    // 대기목록 자료형 -> 큐
    var wait = priorities
    
    // a b c d 대기목록
    // 2 1 3 2 중요도 
    // 내가 인쇄를 요청한 문서가 몇번 쨰로 인쇄 될까? 
    
    // 숫자가 클수록 중요하다
    
    var order = 0
    var location = location
    
    while true {
        // 대기목록에 있는 것들이 다 인쇄될떄까지
        
        // 대기목록의 첫번째가 가장 큰 수인지 ??
        if wait.first! == wait.max() {
            wait.removeFirst()
            order += 1
            
            if location == 0 {
                // 만약 내가 원하던 문서가 출력되면
                break
            } else {
                location -= 1
                // 아니면 1개 밀림
            }
        } else {
            // 가장 큰 수 가 아니라면 맨뒤로 보낸다.
            wait.append(wait.removeFirst())
            if location == 0 {
                // 만약 내가 요청한 문서가 뒤로 간다면 ?
                location = wait.count - 1
            } else {
                // 그냥 앞으로 밀려나는 경우
                location -= 1
            }   
        }   
    }
    return order
}