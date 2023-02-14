import Foundation

var wordDict = [String:Int]()
var count = 0

func solution(_ word:String) -> Int {

    DFS(wordLetters: [])
    return wordDict[word]!
}

func DFS(wordLetters: [String]) {
    let word = wordLetters.joined()
    wordDict[word] = count

    if wordLetters.count == 5 {
        return
    } else {
        let letters = ["A", "E", "I", "O", "U"]
        for letter in letters {
            count += 1
            DFS(wordLetters: wordLetters + [letter])
        }
    }
}
