let nm = readLine()!.split(separator: " ").map { Int(String($0))! }

    let n = nm[0] // map의 size
    let m = nm[1] // 치킨집 개수

    // map setting
    var map = [[Int]]()

    for _ in 1...n {
        let line = readLine()!.split(separator: " ").map { Int(String($0))! }

        map.append(line)
    }

    // 1. 치킨집의 좌표를 구한다, 집의 좌표를 구한다.

    var chickenPos = [(Int, Int)]()
    var homePos = [(Int, Int)]()

    for i in 0..<n {
        for j in 0..<n {
            if map[i][j] == 2 {
                chickenPos.append((i+1,j+1))
            } else if map[i][j] == 1 {
                homePos.append((i+1,j+1))
            }
        }
    }

    // 2. 폐업하고 남은 치킨집의 개수로 조합을 만든다. 전체에서 m개
    // - combination 구현

    var chickenCombi = [[(Int, Int)]]()
    // var combiIndex = 0

    func combination(_ array: [(Int, Int)],_ index: Int,_ now: [(Int, Int)]) {

        // m개의 조합 만큼 찾았을 경우 저장
        if now.count == m {
            chickenCombi.append(now)
            return
        }

        for i in index..<array.count {
            combination(array, i+1, now+[array[i]])
        }
    }

    // - combination 함수 실행 : m개의 조합
    combination(chickenPos, 0, [])

    // 3. 치킨거리 구하기 ?? - 조합 배열 ~

    var chickenSum = [Int]()

    for i in 0..<chickenCombi.count {
        // 첫 번째 조합에서 구해야하는 것 : 치킨거리의 합.
        // 치킨거리의 합을 구하기 위해서 ?
        var sumDist = 0

        for h in 0..<homePos.count {
            var chickenDist = 100

            for j in 0..<chickenCombi[i].count {

                // 하나의 집에 대해서 m개의 치킨거리를 비교해보기.
                chickenDist = min(chickenDist, abs(chickenCombi[i][j].0-homePos[h].0) + abs(chickenCombi[i][j].1-homePos[h].1))
            }

            // 치킨거리를 전부 더해준다.
            sumDist += chickenDist
        }
        // 최종 치킨거리를 배열에 추가
        chickenSum.append(sumDist)
    }

    print(chickenSum.min()!)