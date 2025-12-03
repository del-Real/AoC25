import Foundation

struct InputReader {
    static func read(day: Int) -> String? {
        let fileName = String(format: "Day%02dInput.txt", day)
        let path = "./Inputs/\(fileName)"

        do {
            let source = try String(contentsOfFile: path, encoding: .utf8)
            return source
        } catch {
            print("Could not read file\(error)")
            return nil
        }
    }
}
