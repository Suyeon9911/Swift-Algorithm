import Foundation

func solution(_ n:Int) -> Int 
{
    var devideN = n
    var answer = 0
    
    while devideN != 0 {
        if devideN % 2 == 1 {
            answer += 1
        }
        
        devideN = devideN/2
    }
    
    return answer
}