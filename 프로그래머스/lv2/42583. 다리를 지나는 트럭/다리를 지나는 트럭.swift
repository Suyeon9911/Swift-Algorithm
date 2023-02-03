import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    
    // 다리 길이에 맞춰 다리 만들어주기
    var bridge = Array(repeating: 0, count: bridge_length)
    var trucks = truck_weights 
    var time = 0 
    var bridgeWeight = 0 // 현재의 무게를 업데이트
    
    // 다리의 빈공간 만큼 배열 만들기 -> while문 돌릴때마다 트럭배열에서 제거
    
    while !bridge.isEmpty {
        time += 1
        // 다리를 건너고 있는 트럭에서 1초에 한번씩 맨 앞의 원소를 제거해준다 + 무게에서 빼준다.
        bridgeWeight -= bridge.removeFirst() 
        
        // 다리에 진입할 트럭의 조건 계산 
        if let t = trucks.first {
            // 제한 하중에 만족하면
            if t + bridgeWeight <= weight {
                bridgeWeight += trucks.removeFirst()
                bridge.append(t) // 다리에 추가 
            } else {
                // 제한 하중이 안될 경우 
                bridge.append(0) // 못들어가므로 0추가
            }
        }
    }
    
    
    return time
}