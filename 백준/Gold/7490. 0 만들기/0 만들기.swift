import Foundation

    let testCase = Int(readLine()!)!

    var operators: [String] = []

    for _ in 1...testCase {
        let num = Int(readLine()!)!
        operators = []

        dfs(n: num, count: 0, oper: Array(repeating: "", count: num-1))

        let integers = Array(1...num)

        for oper in operators {

            let operArray = Array(oper).map {String($0)}

            var string = ""
            for i in 0..<num-1 {
                string += String(integers[i])
                string += operArray[i]
            }

            string += String(integers.last!)

            if calculate(string: string) == 0 {
                print(string)
            }
        }
        print()
    }

    func dfs(n: Int, count: Int, oper: [String]) {

        var oper = oper

        if count == n-1 {
            operators.append(oper.joined())
            // print(operators)
            return
        }


        oper[count] = " "
        dfs(n: n, count: count+1, oper: oper)

        oper[count] = "+"
        dfs(n: n, count: count+1, oper: oper)

        oper[count] = "-"
        dfs(n: n, count: count+1, oper: oper)
    }

    func calculate(string: String) -> Int {
        let str = string.replacingOccurrences(of: " ", with: "")

        let numbers = str.components(separatedBy: ["+","-"]).map { Int($0)! }
        let opers = str.split(whereSeparator: { $0.isNumber })

        if numbers.count == 1 {
            return numbers[0]
        }

        var result = numbers[0]

        for i in 0..<opers.count {
            if opers[i] == "+" {
                result += numbers[i+1]
            } else {
                result -= numbers[i+1]
            }
        }

        return result
    }