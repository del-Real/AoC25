import Foundation

struct Day04: Day {
    let day = 4
    let input: String

    init() {
        if let inputData = InputReader.read(day: day) {
            self.input = inputData
        } else {
            self.input = ""
        }
    }

    func part1() -> String {
        // Allocate input into a matrix where every cell is a character
        let inputMtx: [[Character]] =
            input
            .split(separator: "\n")
            .map { line in
                Array(line)
            }

        var totalCount = 0

        for i in 0..<inputMtx.count {
            for j in 0..<inputMtx[i].count {
                var adjacentCount = 0

                if inputMtx[i][j] == "@" {
                    // inputMtx[i-1][j-1]
                    if i > 0 && j > 0 && inputMtx[i - 1][j - 1] == "@" {
                        adjacentCount += 1
                    }

                    // inputMtx[i-1][j]
                    if i > 0 && inputMtx[i - 1][j] == "@" {
                        adjacentCount += 1
                    }

                    // inputMtx[i-1][j+1]
                    if i > 0 && j + 1 < inputMtx[i].count
                        && inputMtx[i - 1][j + 1] == "@"
                    {
                        adjacentCount += 1
                    }

                    // inputMtx[i][j-1]
                    if j > 0 && inputMtx[i][j - 1] == "@" {
                        adjacentCount += 1
                    }

                    // inputMtx[i][j+1]
                    if j + 1 < inputMtx[i].count && inputMtx[i][j + 1] == "@" {
                        adjacentCount += 1
                    }

                    // inputMtx[i+1][j-1]
                    if i + 1 < inputMtx.count && j > 0
                        && inputMtx[i + 1][j - 1] == "@"
                    {
                        adjacentCount += 1
                    }

                    // inputMtx[i+1][j]
                    if i + 1 < inputMtx.count && inputMtx[i + 1][j] == "@" {
                        adjacentCount += 1
                    }

                    // inputMtx[i+1][j+1]
                    if i + 1 < inputMtx.count && j + 1 < inputMtx[i].count
                        && inputMtx[i + 1][j + 1] == "@"
                    {
                        adjacentCount += 1
                    }

                    // Check if the cell has less than 4 adjacent paper rolls
                    if adjacentCount < 4 {
                        totalCount += 1
                    }
                }
            }
        }

        let result = String(totalCount)
        return result
    }
    func part2() -> String {
        // Allocate input into a matrix where every cell is a character
        var inputMtx: [[Character]] =
            input
            .split(separator: "\n")
            .map { line in
                Array(line)
            }

        var nextIter = true
        var iterCount = 0
        var totalCount = 0
        var modifiedMtx = inputMtx

        while nextIter {
            iterCount = 0
            for i in 0..<inputMtx.count {
                for j in 0..<inputMtx[i].count {
                    var adjacentCount = 0

                    if inputMtx[i][j] == "@" {
                        // inputMtx[i-1][j-1]
                        if i > 0 && j > 0 && inputMtx[i - 1][j - 1] == "@" {
                            adjacentCount += 1
                        }

                        // inputMtx[i-1][j]
                        if i > 0 && inputMtx[i - 1][j] == "@" {
                            adjacentCount += 1
                        }

                        // inputMtx[i-1][j+1]
                        if i > 0 && j + 1 < inputMtx[i].count
                            && inputMtx[i - 1][j + 1] == "@"
                        {
                            adjacentCount += 1
                        }

                        // inputMtx[i][j-1]
                        if j > 0 && inputMtx[i][j - 1] == "@" {
                            adjacentCount += 1
                        }

                        // inputMtx[i][j+1]
                        if j + 1 < inputMtx[i].count
                            && inputMtx[i][j + 1] == "@"
                        {
                            adjacentCount += 1
                        }

                        // inputMtx[i+1][j-1]
                        if i + 1 < inputMtx.count && j > 0
                            && inputMtx[i + 1][j - 1] == "@"
                        {
                            adjacentCount += 1
                        }

                        // inputMtx[i+1][j]
                        if i + 1 < inputMtx.count && inputMtx[i + 1][j] == "@" {
                            adjacentCount += 1
                        }

                        // inputMtx[i+1][j+1]
                        if i + 1 < inputMtx.count && j + 1 < inputMtx[i].count
                            && inputMtx[i + 1][j + 1] == "@"
                        {
                            adjacentCount += 1
                        }

                        // Check if the cell has less than 4 adjacent paper rolls
                        if adjacentCount < 4 {
                            iterCount += 1
                            modifiedMtx[i][j] = "."
                        }
                    }
                }
            }  // end for loop

            // Check if no more paper rolls are removed
            if iterCount == 0 {
                nextIter = false
            }
            // Add the iteration count to the total and remove paper rolls from matrix
            totalCount += iterCount
            inputMtx = modifiedMtx
        }  // end while

        let result = String(totalCount)
        return result
    }
}
