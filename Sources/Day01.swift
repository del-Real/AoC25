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
        var curDialPos = 50

        // Read input line by line
        for i in 0..<lines.count {

            // Check wether the rotation is left (L) or right (R)
            if let rotation = lines[i].first,
                // Check times
                let times = Int(lines[i].dropFirst())
            {
                let timesNoLaps = times % 100

                // Left rotation
                if rotation == "L" {
                    curDialPos -= timesNoLaps

                    if curDialPos < 0 {
                        curDialPos = 100 - abs(curDialPos)
                    }
                }

                // Right rotation
                else if rotation == "R" {
                    curDialPos += timesNoLaps

                    if curDialPos > 99 {
                        curDialPos -= 100
                    }
                }

                // Dial at 0, so count is increased
                if curDialPos == 0 {
                    count += 1
                }
            }
        }
        let result = String(count)
        return result
    }

    func part2() -> String {

        let lines = input.split(separator: "\n")
        var count = 0
        var curDialPos = 50
        var newDialPos = 0

        // Read input line by line
        for i in 0..<lines.count {

            // Check wether the rotation is left (L) or right (R)
            if let rotation = lines[i].first,
                // Check times
                let times = Int(lines[i].dropFirst())
            {
                let laps = times / 100
                let timesNoLaps = times % 100

                // Left rotation (L)
                if rotation == "L" {
                    newDialPos = curDialPos - timesNoLaps

                    // At start dial points at 0
                    if curDialPos == 0 {
                        if newDialPos < 0 {
                            newDialPos = 100 - abs(newDialPos)
                            count += laps
                        } else {
                            count += laps
                        }
                    }

                    // At start dial points at number != 0
                    else {
                        if newDialPos < 0 {
                            newDialPos = 100 - abs(newDialPos)
                            count += laps + 1
                        } else if newDialPos == 0 {
                            count += laps + 1
                        } else {
                            count += laps
                        }
                    }
                    curDialPos = newDialPos
                }

                // Right rotation (R)
                else if rotation == "R" {
                    newDialPos = curDialPos + timesNoLaps

                    // At start dial points at 0
                    if curDialPos == 0 {
                        if newDialPos > 99 {
                            newDialPos -= 100
                            count += laps
                        } else {
                            count += laps
                        }
                    }

                    // At start dial points at number != 0
                    else {
                        if newDialPos > 99 {
                            newDialPos -= 100
                            count += laps + 1
                        } else {
                            count += laps
                        }
                    }
                    curDialPos = newDialPos
                } else {
                    print("Invalid input: \(rotation)\(times)")
                }
            }
        }
        let result = String(count)
        return result
    }
}
