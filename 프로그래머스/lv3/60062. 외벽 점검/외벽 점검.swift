import Foundation

func solution(_ n:Int, _ weak:[Int], _ dist:[Int]) -> Int {
    
    // 1. 길이를 2배로 늘려서 원형을 1자로 만들기
    var weak = weak
    let len = weak.count
    
    for i in 0..<weak.count {
        weak.append(weak[i] + n)
    }
    
    print(weak)
    
    // 2. 답 변수 : 투입할 친구의 최솟값을 찾을 것임 dist.count + 1 로 초기화
    var answer = dist.count + 1
    
    // 3. 0부터 기존 weak배열의 길이까지의 위치를 각각 시작 지점이라고 설정해두고 완전 탐색
    // 0 지점 시작.. 5 지점에서 시작...10 지점에서 시작까지 
    
    // 3-1. 친구를 나열하는 모든 경우의 수 ! - 순열 구하기 
    let friends = permutation(dist, dist.count)
    for start in 0..<len {
        for i in friends {
            var count = 1 // 친구의 수 
            // 해당 친구가 점검할 수 있는 마지막 위치
            // = 시작 지점 + 해당 친구가 갈수 있는 거리
            var position = weak[start] + i[count-1]
            
            // 3-2. 시작 지점부터 모든 취약지점을 확인한다.
            for index in start..<start+len {
                // start ~ start + len = 한바퀴
                
                // 만약 친구가 갈 수 있는 점검 위치를 벗어가는 경우
                if position < weak[index] {
                    count += 1 // 새로운 친구를 투입한다.
                    if count > dist.count {
                        // 더 이상 투입할 친구가 없다면 
                        break
                    }
                    
                    // 끊긴 지점 부터 다시 새로운 친구가 할 수 있도록 위치 update
                    position = weak[index] + i[count-1]
                }
            }
            
            // 반복문을 다 돌고 투입된 친구 구하기 ! => 이걸 모든 순열의 경우에 대해서 반복.
            answer = min(answer, count)
        }      
    }
    
    if answer > dist.count {
        return -1
    }
    
    return answer
}

func permutation(_ array: [Int],_ k: Int) -> [[Int]] {
    
    var result = [[Int]]()
    var check = Array(repeating: false, count: array.count)
    
    func cycle(_ now: [Int]) {
        if now.count == k {
            result.append(now)
            return
        }
        
        for i in 0..<array.count {
            if !check[i] {
                check[i] = true
                cycle(now + [array[i]])
                check[i] = false
            } else {
                continue
            }
        }
    }
    
    cycle([])
    
    return result
}