import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    var result: [Int] = []
    
    for command in commands {
        let first = command[0]-1
        let second = command[1]-1
        let target = command[2]-1
        
        let sorted = array[first...second].sorted()
        
        result.append(sorted[target])
    }
    return result
}