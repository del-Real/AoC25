import Foundation

struct Day02: Day {
    let day = 2
    let input: String

    init() {
        if let inputData = InputReader.read(day: 2) {
            self.input = inputData
        } else {
            self.input = ""
        }
    }

    func part1() -> String {
        
        let lines = input.split(separator: ",")
        
        
        print(lines[0].split(separator: "-"))
        
        return ""
    }

    func part2() -> String {
        return "Pending"
    }
}
