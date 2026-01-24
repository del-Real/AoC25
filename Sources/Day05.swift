import Foundation

struct Day05: Day {
    let day = 5
    let input: String

    init() {
        if let inputData = InputReader.read(day: day) {
            self.input = inputData
        } else {
            self.input = ""
        }
    }

    func part1() -> String {

        let lines = input.split(separator: "\n")
        var ingredientIdRanges: [ClosedRange<Int>] = []  // intervals
        var ingredientIds: [Int] = []  // integers
        var freshCount = 0

        for line in lines {
            // Parse intervals
            if line.contains("-") {
                let parts = line.components(separatedBy: "-")
                if parts.count == 2,
                    let start = Int(parts[0]),
                    let end = Int(parts[1])
                {
                    ingredientIdRanges.append(start...end)
                }
            }
            // Parse integers
            else {
                ingredientIds.append(Int(line)!)
            }
        }

        // Check Ingredients IDs in every interval, if included remove it from the array
        for interval in ingredientIdRanges {
            var i = 0
            for _ in ingredientIds {
                if interval.contains(ingredientIds[i]) {
                    freshCount += 1
                    ingredientIds.remove(at: i)
                    i -= 1
                }
                i += 1
            }
        }

        let result = String(freshCount)
        return result
    }

    func part2() -> String {

        let lines = input.split(separator: "\n")
        var ingredientIdRanges: [ClosedRange<Int>] = []  // intervals

        for line in lines {
            // Parse intervals
            if line.contains("-") {
                let parts = line.components(separatedBy: "-")
                if parts.count == 2,
                    let start = Int(parts[0]),
                    let end = Int(parts[1])
                {
                    ingredientIdRanges.append(start...end)
                }
            }
        }

        ingredientIdRanges.sort {
            if $0.lowerBound != $1.lowerBound {
                return $0.lowerBound < $1.lowerBound
            }
            return $0.upperBound < $1.upperBound
        }

        var freshIdsCount = 0
        var maxUpperValue = 0

        for i in 0..<ingredientIdRanges.count {
            var startInterval = ingredientIdRanges[i].lowerBound
            let endInterval = ingredientIdRanges[i].upperBound
            var freshIdsInterval = 0

            if startInterval <= maxUpperValue {
                if endInterval > maxUpperValue {

                    startInterval = maxUpperValue + 1
                    freshIdsInterval += (endInterval - startInterval) + 1
                    maxUpperValue = endInterval
                }
            }
            // (if startInterval > maxUpperValue)
            else {
                freshIdsInterval += (endInterval - startInterval) + 1
                maxUpperValue = endInterval
            }

            freshIdsCount += freshIdsInterval
        }

        let result = String(freshIdsCount)
        return result
    }
}
