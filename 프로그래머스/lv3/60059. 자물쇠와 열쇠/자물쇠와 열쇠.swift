import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    var key = key
    let n = lock.count
    let m = key.count

    // key를 돌리는 함수
    func rotate() {
        var newKey = [[Int]]()
        for x in 0..<m {
            var temp = [Int]()
            for y in (0..<m).reversed() {
                temp.append(key[y][x])
            }
            newKey.append(temp)
        }
        key = newKey
    }

    // 현재 key를 기준으로 test를 수행하는 함수
    func test() -> Bool {
        for py in 1-m..<n+1 {
            for px in 1-m..<n+1 {
                var mlock = lock
                for y in 0..<m {
                    for x in 0..<m {
                        if py+y >= 0 && px+x >= 0 && py+y < n && px+x < n { 
                            mlock[py+y][px+x] += key[y][x]
                        }
                    }
                }
                if check(mlock) { return true }
            }
        }
        return false
    }

    // 현재 자물쇠값을 확인하는 함수
    func check(_ lock: [[Int]]) -> Bool {
        for y in 0..<lock.count {
            for x in 0..<lock.count {
                if lock[y][x] != 1 {
                    return false
                }
            }   
        }
        return true
    }

    // 현재 상태에서 한번 테스트
    if test() { return true }

    // 돌려서 테스트 3번
    for _ in 1...3 {
        rotate()
        if test() { return true }
    }

    return false
}