import Foundation

let days: [Day] = [
    Day01(),
    Day02(),
    Day03(),
    Day04(),
    Day05(),
    Day06()
]

let currentDay = 6

//days.forEach { $0.run() }
days[currentDay - 1].run()
