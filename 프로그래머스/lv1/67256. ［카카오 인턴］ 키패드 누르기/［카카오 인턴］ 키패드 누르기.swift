import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    
    var leftArray = [1,4,7]
    var rightArray = [3,6,9]
    
    var leftHandPosition = 10 // *
    var rightHandPosition = 12 // #
    
    var result = ""
    
    func left(num: Int) {
        leftHandPosition = num
        result += "L"
    }
    
    func right(num: Int) {
        rightHandPosition = num
        result += "R"
    }
    
    for i in numbers {
        // 0일 경우 11로 바꿔주기
        let num = (i == 0) ? 11 : i
        
        if leftArray.contains(num) {
            left(num: num)
        } else if rightArray.contains(num) {
            right(num: num)
        } else {
            let leftDiff = (num-leftHandPosition).magnitude
            let rightDiff = (num-rightHandPosition).magnitude
            
            let leftDistance = (leftDiff/3) + (leftDiff%3)
            let rightDistance = (rightDiff/3) + (rightDiff%3)
            
            if leftDistance < rightDistance {
                left(num: num)
            } else if leftDistance > rightDistance {
                right(num: num)
            } else {
                hand == "right" ? right(num: num) : left(num: num)
            }
        }
    }
    
    
    return result
}