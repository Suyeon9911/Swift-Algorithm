import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var answer = 0
    
    var n = n
    var a = a
    var b = b
    
    while n >= 2 {
        
        if abs(a-b) == 1 && (nextNum(a) == nextNum(b)) {
            answer += 1
            break
        }
        
        answer += 1
        n = n / 2
        a = nextNum(a)
        b = nextNum(b)
    }

    return answer
}

func nextNum(_ num: Int) -> Int {
    if num % 2 == 0 {
        return num / 2
    } else {
        return (num / 2) + (num % 2)
    }
}