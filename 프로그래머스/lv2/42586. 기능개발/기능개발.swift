import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    // 기능 개선 - 진도가 100프로일 떄 반영

    // 뒤의 기능이 먼저 개발될 수도 있지만, 앞에 기능이 배포될 때 함께 배포
    // 먼저 배포되어야하는 순서대로 작업 진도 배열 progresses
    // 각 작업의 속도 speeds
    // 각 배포마다 몇 개의 기능이 배포되는지 return

    var answer: [Int] = []
    var progresses = progresses
    var speeds = speeds

    while !progresses.isEmpty {

        // 하루가 지날때마다 progresses에 speeds를 더해준다.
        // progresses에서 100프로 이상인 것들을 제거해준다 -> 앞에서부터..
        
        for i in progresses.indices {
            progresses[i] += speeds[i]
        }

        var count = 0

        for i in 0..<progresses.count {
            if progresses[i] >= 100 {
                count += 1
            } else {
                break
            }
        }

        progresses.removeFirst(count)
        speeds.removeFirst(count)
        
        // 배포가 된다면
        if count != 0 {
            answer.append(count)
        }
    }


    return answer
}