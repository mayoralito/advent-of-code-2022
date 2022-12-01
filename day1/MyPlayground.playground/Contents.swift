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
            elfCalories = 0
        }
    })
    
    return elfs
}

var input = load(file: "input", ofType: "txt") ?? ""
let elfItems = calculateCaloriesPerElf(input)

// Sort
let sortedElfs = elfItems.sorted { val1, val2 in
    val1 >= val2
}
// The most
let elfSaver = sortedElfs[0]
// The 3 most
let the3ElfSavers = sortedElfs[0] + sortedElfs[1] + sortedElfs[2]

print("elfSaver: \(String(describing: elfSaver))")
print("the3ElfSavers: \(the3ElfSavers)")
