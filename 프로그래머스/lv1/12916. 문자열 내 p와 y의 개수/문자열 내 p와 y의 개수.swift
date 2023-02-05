import Foundation

func solution(_ s:String) -> Bool
{
    var yCount: Int = 0
    var pCount: Int = 0
    let lowerString = s.lowercased()
    
    for i in lowerString {
        if i == "y" {
            yCount += 1
        }
        
        if i == "p" {
            pCount += 1
        }
    }

    return yCount == pCount ? true : false
}