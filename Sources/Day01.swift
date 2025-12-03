import Foundation

struct Day01: Day {
    let day = 1
    let input: String

    init() {
        if let inputData = InputReader.read(day: 1) {
            self.input = inputData
        } else {
            self.input = ""
        }
    }

    func part1() -> String {

        let lines = input.split(separator: "\n")
        var count = 0
        var dialPos = 50

        // Read input line by line
        for i in 0..<lines.count {

            // Check wether the rotation is left (L) or right (R)
            if let rotation = lines[i].first {
                // Check times
                let times: Int? = Int(lines[i].dropFirst())
                if let unwTimes = times {
                    // Left rotation
                    if rotation == "L" {
                        var value = unwTimes

                        let laps = Int((unwTimes) / 100)
                        value -= (Int(laps) * 100)

                        dialPos -= value

                        if dialPos < 0{
                            dialPos = 100 - abs(dialPos)
                        }
                    }
                    // Right rotation
                    else if rotation == "R" {
                        var value = unwTimes

                        let laps = Int((unwTimes) / 100)
                        value -= (Int(laps) * 100)

                        dialPos += value

                        if dialPos > 99 {
                            dialPos -= 100
                        }
                    }

                    // Dial at 0, so count is increased
                    if dialPos == 0 {
                        count += 1
                    }
                }
            }

        }

        let result = String(count)
        return result
    }

    func part2() -> String {
       
        let lines = input.split(separator: "\n")
        var count = 0
        var dialPos = 50

        // Read input line by line
        for i in 0..<lines.count {

            // Check wether the rotation is left (L) or right (R)
            if let rotation = lines[i].first {
                // Check times
                let times: Int? = Int(lines[i].dropFirst())
                if let unwTimes = times {
                    print("\(rotation)\(unwTimes)")
                    // Left rotation
                    if rotation == "L" {
                        var value = unwTimes

                        let laps = Int((unwTimes) / 100)
                        value -= (Int(laps) * 100)

                        dialPos -= value

                        if dialPos < 0{
                            dialPos = 100 - abs(dialPos)
                            print("f1")
                        }
                        print("\(dialPos)\n")
                    }
                    // Right rotation
                    else if rotation == "R" {
                        var value = unwTimes

                        let laps = Int((unwTimes) / 100)
                        value -= (Int(laps) * 100)

                        dialPos += value

                        if dialPos > 99 {
                            dialPos -= 100
                            print("f2")
                        }
                        print("\(dialPos)\n")
                    }

                    // Dial at 0, so count is increased
                    if dialPos == 0 {
                        count += 1
                    }
                }
            }

        }

        let result = String(count)
        return result
    }
}
