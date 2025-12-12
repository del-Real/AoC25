import Foundation

let days: [Day] = [
    Day01(),
    Day02(),
    Day03(),
    Day04(),
    Day05()
]

let currentDay = 5

//days.forEach { $0.run() }
days[currentDay - 1].run()
