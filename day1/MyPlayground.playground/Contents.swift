import UIKit
import PlaygroundSupport

func load(file named: String, ofType fileType: String) -> String? {
    guard let fileUrl = Bundle.main.url(forResource: named, withExtension: fileType) else {
        return nil
    }
    
    guard let content = try? String(contentsOf: fileUrl, encoding: .utf8) else {
        return nil
    }
    
    return content
}

func calculateCaloriesPerElf(_ input: String) -> [Int] {
    var elfs: [Int] = []
    var elfCalories: Int = 0
    
    input.enumerateLines(invoking: { calories, stop in
        let countCalories: Int = Int(calories) ?? 0
        elfCalories += countCalories
        if calories.isEmpty {
            elfs.append(elfCalories)
            // Reset elf counter
            elfCalories = 0
        }
        
    })
    
    return elfs
}

func getElfWithMoreCalories(elfs: [Int]) -> Int? {
    return elfs.max { before, current in
        before <= current
    }
}

var input = load(file: "input", ofType: "txt") ?? ""
let elfItems = calculateCaloriesPerElf(input)
let elfSaver = getElfWithMoreCalories(elfs: elfItems)
print("elfSaver: \(String(describing: elfSaver))")
