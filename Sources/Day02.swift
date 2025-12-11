import Foundation

struct Day02: Day {
    let day = 2
    let input: String

    init() {
        if let inputData = InputReader.read(day: day) {
            self.input = inputData
        } else {
            self.input = ""
        }
    }

    func part1() -> String {

        var count = 0
        let lines = input.split { $0 == "," || $0 == "\n" }

        // Loop to get intervals
        for line in lines {
            let intervals = line.split(separator: "-")

            // Get first and second elements of the interval
            guard intervals.count == 2,
                let start = Int(intervals[0]),
                let end = Int(intervals[1])
            else {
                print("Invalid interval", line)
                continue
            }

            var iterValue = start

            // Iterate from start to end
            while iterValue <= end {

                let numStr = String(iterValue)
                let numDigits = String(iterValue).count
                let splitPos = numDigits / 2

                // Check if number has pair digits
                if numDigits % 2 == 0 {
                    let index = numStr.index(
                        numStr.startIndex,
                        offsetBy: splitPos
                    )

                    // Split number in two parts
                    let firstPart = Int(numStr[..<index])
                    let secondPart = Int(numStr[index...])

                    // Both parts identical then is a invalid ID
                    if firstPart == secondPart {
                        count += iterValue
                    }
                }
                iterValue += 1
            }
        }

        let result = String(count)
        return result
    }

    func part2() -> String {
        let start = CFAbsoluteTimeGetCurrent()
        var count = 0
        let lines = input.split { $0 == "," || $0 == "\n" }

        // Loop to get intervals
        for line in lines {
            let intervals = line.split(separator: "-")

            // Get first and second elements of the interval
            guard intervals.count == 2,
                let start = Int(intervals[0]),
                let end = Int(intervals[1])
            else {
                print("Invalid interval", line)
                continue
            }
            //print("[\(start), \(end)]")

            var iterValue = start

            // Iterate from start to end
            while iterValue <= end {

                let numDigits = String(iterValue).count
                let iterValueStr = String(iterValue)

                // Regex init
                var regexStr = String(iterValueStr.prefix(1))
                let pfxLimit = numDigits / 2
                var pfxCurr = 1
                var countMatches = 0

                while pfxCurr <= pfxLimit {

                    regexStr = String(iterValueStr.prefix(pfxCurr))

                    // Find matches
                    let regexPattern = try! Regex(regexStr)
                    countMatches = iterValueStr.matches(of: regexPattern).count

                    // Add as invalid Id
                    if countMatches * pfxCurr == numDigits {
                        count += iterValue
                        //print("\t\(iterValueStr) - \(countMatches)")
                        break
                    }
                    pfxCurr += 1
                }
                iterValue += 1
            }
        }
        let end = CFAbsoluteTimeGetCurrent()
        print("Time elapsed: \(end - start) seconds")

        let result = String(count)
        return result
    }
}
