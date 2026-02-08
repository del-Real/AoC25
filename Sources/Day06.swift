import Foundation

struct Day06: Day {
    let day = 6
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
        var mtx: [[String]] = []
        var dgtMtx: [[Int]] = []
        var symArr: [String] = []

        for line in lines {
            let items = line.split(separator: " ").map { String($0) }
            mtx.append(items)
        }

        // Set mtx rows - 1 and same number of columns
        dgtMtx = [[Int]](
            repeating: [Int](repeating: 0, count: mtx.count - 1),
            count: mtx[0].count
        )

        // Set mtx number of columns as number of indices
        symArr = [String](repeating: "", count: mtx[0].count)

        // Iterate column first
        for j in 0..<mtx[0].count {
            for i in 0..<mtx.count {
                if i < mtx.count - 1 {
                    if let dgt = Int(mtx[i][j]) {
                        dgtMtx[j][i] = dgt
                    }
                } else {
                    symArr[j] = mtx[i][j]
                }
            }
        }

        var totalCount = 0
        var currSym = 0

        for i in 0..<dgtMtx.count {

            var colCount = 0

            for j in 0..<dgtMtx[i].count {
                if symArr[currSym] == "+" {

                    colCount += dgtMtx[i][j]

                } else if symArr[currSym] == "*" {

                    if colCount == 0 {
                        colCount = 1
                    }
                    if dgtMtx[i][j] != 0 {
                        colCount *= dgtMtx[i][j]
                    }
                }
            }
            currSym += 1
            totalCount += colCount
        }

        let result = String(totalCount)
        return result
    }

    func part2() -> String {
        let lines = input.split(separator: "\n")
        var mtx: [[String]] = []
        var dgtMtx: [[Int]] = []
        var symArr: [String] = []

        for line in lines {
            let items = line.split(separator: " ").map { String($0) }
            mtx.append(items)
        }

        // Set mtx rows - 1 and same number of columns
        dgtMtx = [[Int]](
            repeating: [Int](repeating: 0, count: mtx.count - 1),
            count: mtx[0].count
        )

        // Set mtx number of columns as number of indices
        symArr = [String](repeating: "", count: mtx[0].count)

        // Iterate column first
        for j in 0..<mtx[0].count {
            for i in 0..<mtx.count {
                if i < mtx.count - 1 {
                    if let dgt = Int(mtx[i][j]) {
                        dgtMtx[j][i] = dgt
                    }
                } else {
                    symArr[j] = mtx[i][j]
                }
            }
        }

        print(dgtMtx)
        print(symArr)

        var totalCount = 0
        var currSym = 0

        for i in 0..<dgtMtx.count {

            var colCount = 0

            for j in 0..<dgtMtx[i].count {
                print("\t\(symArr[currSym])")
                print("\t\t\(dgtMtx[i][j])")
                if symArr[currSym] == "+" {

                    colCount += dgtMtx[i][j]
                    print(colCount)

                } else if symArr[currSym] == "*" {

                    if colCount == 0 {
                        colCount = 1
                    }
                    if dgtMtx[i][j] != 0 {
                        colCount *= dgtMtx[i][j]
                    }
                    print(colCount)
                }
            }
            currSym += 1
            totalCount += colCount
            print("Col count: \(colCount)")
            print("Total count: \(totalCount)")
            print()
        }

        let result = String(totalCount)
        return result
    }
}
