import Foundation

struct Day03: Day {
    let day = 3
    let input: String

    init() {
        if let inputData = InputReader.read(day: day) {
            self.input = inputData
        } else {
            self.input = ""
        }
    }

    func part1() -> String {

        // Allocate input into a matrix where every cell is an integer
        let inputMtx: [[Int]] =
            input
            .split(separator: "\n")
            .map { line in
                line.map { Int(String($0))! }
            }

        var batteries = 0
        var totalJoltage = 0
        var firstDigit = 0
        var secondDigit = 0

        for i in 0..<inputMtx.count {

            // Find max value in line dropping last value
            let line = Array(inputMtx[i].dropLast())
            firstDigit = line.max() ?? 0
            let firstDigitIndex = line.firstIndex(of: firstDigit) ?? 0
            secondDigit = 0

            for j in firstDigitIndex + 1..<inputMtx[i].count {
                if inputMtx[i][j] > secondDigit {
                    secondDigit = inputMtx[i][j]
                }
            }

            batteries = firstDigit * 10 + secondDigit  // a * 10 + b
            totalJoltage += batteries
        }

        let result = String(totalJoltage)
        return result
    }
    func part2() -> String {

        // Allocate input into a matrix where every cell is an integer
        let inputMtx: [[Int]] =
            input
            .split(separator: "\n")
            .map { line in
                line.map { Int(String($0))! }
            }

        var batteries: [Int]
        var lastDigitIndex: Int
        var remainingDigits: Int
        var totalJoltage = 0

        for i in 0..<inputMtx.count {
            // Reset batteries
            batteries = Array(repeating: 0, count: 12)
            lastDigitIndex = 0
            remainingDigits = 12
            var k = 0

            for j in 0..<inputMtx[i].count {
                // Verify if next number is higher and enough numbers still left
                if inputMtx[i][j] > batteries[0]
                    && remainingDigits <= inputMtx[i].count - j
                {
                    batteries[k] = inputMtx[i][j]
                    lastDigitIndex = j
                }
            }

            remainingDigits -= 1
            k += 1

            while remainingDigits > 0 {
                for j in lastDigitIndex + 1..<inputMtx[i].count {
                    // Verify if next number is higher and enough numbers still left
                    if inputMtx[i][j] > batteries[k]
                        && remainingDigits <= inputMtx[i].count - j
                    {
                        batteries[k] = inputMtx[i][j]
                        lastDigitIndex = j
                    }
                }
                remainingDigits -= 1
                k += 1
            }

            // Convert array of digits into one digit and add it to total joltage
            let batteriesValue = Int(batteries.map(String.init).joined())!
            totalJoltage += batteriesValue
        }

        let result = String(totalJoltage)
        return result
    }
}
