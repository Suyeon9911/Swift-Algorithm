    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = line[0]
    let share = line[1]

    var house: [Int] = []

    for _ in 0..<n {
        house.append(Int(readLine()!)!)
    }

    house = house.sorted(by: <)
    // print(house)

    var result = 0
    var start = 1
    var end = house[n-1] - house[0]

    while start <= end {
        let mid = (start + end)/2

        var count = 1
        var value = house[0]

        for i in 1..<house.count {
            if house[i] >= value + mid {
                // 좌표 값이 이전에 설치된 공유기와 거리 차이 보다 커야 설치 가능 !
                value = house[i] // 설치 ?
                count += 1
            }
        }

        if count >= share {
            // c개이상의 공유 설치 -> 거리 차이를 더 늘려보자
            start = mid + 1
            result = mid
        } else {
            // c개이상의 공유기 설치 불가 -> 거리차이 좁히기
            end = mid - 1
        }


    }

    print(result)