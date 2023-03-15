import Foundation

func solution(_ dirs:String) -> Int {
    var now = [0, 0]
    // 방문한 길이를 Set 자료형에 저장. 나중에 contain 연산 수행시 시간복잡도가 줄어들 것 같다!
    var visited: Set<[Int]> = []

    for dir in dirs {
        var (dx, dy) = (0, 0)

        // 스위치 문도 위치만 저장하여 깔끔하게 쓰셨다 !

        switch dir {
        case "U": (dx, dy) = (0, 1)
        case "D": (dx, dy) = (0, -1)
        case "L": (dx, dy) = (-1, 0)
        case "R": (dx, dy) = (1, 0)
        default: break
        }

        let next = [now[0]+dx, now[1]+dy] // 다음 좌표

        // 이는 x,y가 맵을 넘어가지는 않는지 판단하는 건데 어차피 5,5 맵이니까
        // 굳이 맵을 만들지 않아도.. abs 사용하는게 좋은 방법인것 같다.
        if abs(next[0]) > 5 || abs(next[1]) > 5 { continue }


        // visited Set에 포함되어있는지 여부를 판단하는데 이런식으로 출발 , 도착을 전부 확인할 수 있는 배열을 만들었다.
        // 중복 거리 계산을 위해서 반대로도 왔던적이 없는지 계산했다.
        
        if !visited.contains(now+next) && !visited.contains(next+now) {
            visited.insert(now+next)
        }

        now = next
    }
    
    return visited.count
}