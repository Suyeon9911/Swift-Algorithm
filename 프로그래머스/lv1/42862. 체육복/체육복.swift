import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
    // 가지고 있는 체육복 개수 저장 번호순대로 ! 기본 1벌
    var students = [Int](repeating: 1, count: n)

    // 잃어버린 사람은 체육복 0벌이 된다.
    for i in lost {
        students[i-1] = 0
    }

    // 여벌 가져오면 + 1벌이 된다.
    for i in reserve {
        students[i-1] += 1
    }

    var count = 0 // 체육복을 빌리지 못한 학생 수
    for i in 0..<n {
        // 학생 배열을 돌면서
        if students[i] == 0 {
            // 체육복이 없으면
            if i>0 && students[i-1]>1 {
                // 앞번호 학생에게 빌려본다.
                students[i] = 1
                students[i-1] = 1
            } else if i<n-1 && students[i+1] > 1 {
                // 뒷번호 학생에게 빌려본다.
                students[i] = 1
                students[i+1] = 1
            } else {
                // 빌리지 못한다.
                count += 1
            }
        }
    }

    return n - count // 전체에서 못빌린 학생 빼면 수업들을 수 있는 학생 수 나옴
}