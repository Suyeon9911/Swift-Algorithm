import Foundation


    func solution() -> Int {

        let _ = Int(String(readLine()!))!
        let numbers = readLine()!.split(separator: " ").map({Int(String($0))!})

        // 만약 입력된 값 중에 최댓값이 음수라면 그 최댓값이 정답이 된다. 음수는 더할 수록 작아지니까
        let maxValue = numbers.max()!
        if maxValue < 0 {
            return maxValue
        }

        var result = 0
        var now = 0

        for i in numbers {
            now += i
            if now < 0 {
                // 합이 0보다 작아지면 답이 아니다. 왜냐면 numbers 배열에 양수가 무조건 있다는 가정하에 양수를 택하는게 이득
                now = 0
            }

            if result < now {
                // max 값 갱신 !
                result = now
            }

            // 1 2 -3 4
            // now = 1 , result = 1
            // now = 3 , result = 3
            // now = 0 , result = 3
            // now = 4 , result = 4

            // 10 -4 3 1 5 6 -35 12 21 -1

            // now = 10, result = 10
            // now = 6, result = 10
            // now = 9, result = 10
            // now = 10, result = 10
            // now = 15, result = 15 _> 3+1+5
            // now = 21, result = 21
            // now = 음수니까 0
            // now = 12, result = 21
            // now = 33, reuslt = 33
            // now = 32 , result = 33 -> 12 21 이 연속된 최대합



        }

        return result

    }

    print(solution())