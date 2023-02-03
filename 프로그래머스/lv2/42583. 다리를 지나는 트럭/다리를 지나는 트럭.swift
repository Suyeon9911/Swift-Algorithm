import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    
    // 일단 문제만 봐도 queue 자료형을 써야한다는 것.
    // 각각 업데이트 해줄 변수들 생성

    var waitTruck = truck_weights
    waitTruck = waitTruck.reversed()
    var time = 0

    var passedTruck: [Int] = []
    var passingTruck: [Int] = []

    while !waitTruck.isEmpty {
        // 1. 다리에 차가 없다면 건너기
        if passingTruck.isEmpty {
            passingTruck.append(waitTruck.removeLast())
            time += bridge_length
        } else {
            // 2. 다리에 차가 있다면
            // 2-1. 올라갈 수 있는 개수가 남았는지 확인
            if bridge_length > passingTruck.count {
                // 2-2. 올라갈 무게가 남아있는지 확인한다.
                let nowSum = passingTruck.reduce(0,+)
                // 올라갈 무게가 남았다면,
                if (weight - nowSum) > waitTruck.last! {
                    if !waitTruck.isEmpty {
                        passingTruck.append(waitTruck.removeLast())
                    }
                    time += bridge_length
                } else {
                    // 올라갈 무게가 안남았다면
                    time += 1
                    if !passingTruck.isEmpty {
                        passedTruck.append(passingTruck.removeFirst())
                    }
                }
            } else {
                // 이미 꽉차 있는 상태
                time += 1
                if !passingTruck.isEmpty {
                    passedTruck.append(passingTruck.removeFirst())
                }
            }
        }
    }

    print(time)
    return time
}