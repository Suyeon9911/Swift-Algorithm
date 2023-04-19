import Foundation

var count: [Int] = [0,0]

func solution(_ arr:[[Int]]) -> [Int] {
    
    
    func quardZip(_ arr: [[Int]],_ row: Int,_ col: Int,_ len: Int) {
        
        let firstElement = arr[row][col]
        
        for i in row..<row+len {
            for j in col..<col+len {
                if arr[i][j] != firstElement {
                    let half = len/2
                    quardZip(arr, row, col, half)
                    quardZip(arr, row+half, col, half)
                    quardZip(arr, row, col+half, half)
                    quardZip(arr, row+half, col+half, half)
                    return
                }
            }
        }
        
        count[firstElement] += 1
    }
    
    quardZip(arr, 0, 0, arr.count)
    
    
    return count
}