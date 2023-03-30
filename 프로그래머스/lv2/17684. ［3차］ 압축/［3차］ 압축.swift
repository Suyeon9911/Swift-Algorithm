func solution(_ msg:String) -> [Int] {

    var msgArray = Array(msg)
    let alphabet = ["A", "B", "C","D", "E", "F","G", "H", "I","J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

    var index = 1
    var dictionary = [String: Int]()

    for i in alphabet {
        dictionary[i] = index
        index += 1
    }

    func checkDic(word: String) -> Bool {
        if dictionary[word] != nil {
            return true
        } else {
            return false
        }
    }

    var dicIdx = 26
    var result = [Int]()

    var startIdx = 0
    var endIdx = 0

    func changeString() -> String {
        if startIdx == 0 {
            return String(msgArray[startIdx])
        }

        if startIdx == msgArray.count-1 {
            return String(msgArray[startIdx])
        }

        var string = String(msgArray[startIdx...endIdx])
        // print(string)
        //  endIdx = end

        while true {

            if Array(dictionary.keys).contains(string) == false {
                endIdx -= 1
                return String(msgArray[startIdx...endIdx])
            } else {
                endIdx += 1

                if endIdx == msgArray.count {
                    endIdx -= 1
                    return String(msgArray[startIdx...endIdx])
                }

                string = String(msgArray[startIdx...endIdx])
            }
        }

        return string
    }

    while endIdx < msgArray.count {

        let changedString = changeString()


        result.append(dictionary[changedString]!)

        if endIdx == msgArray.count-1 {
            break
        }

        let next = String(msgArray[endIdx+1])
        dicIdx += 1
        dictionary[changedString+next] = dicIdx

        endIdx += 1
        startIdx = endIdx
        
    }

    return result
}