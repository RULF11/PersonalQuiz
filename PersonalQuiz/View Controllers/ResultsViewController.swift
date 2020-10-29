//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 26.10.2020.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты на экране
    // 4. Избавится от кнопки возврата на предыдущий экран
    
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        guard let mostCommonanswer = findMostCommonElement(in: answers) else { return }
        emojiLabel.text = "Вы - \(mostCommonanswer.type.rawValue)"
        descriptionLabel.text = mostCommonanswer.type.definition
    }
    
    private func findMostCommonElement(in array: [Answer]) -> Answer? {
        let groupingElements = Dictionary(grouping: array) { $0.type }
        let sorted = groupingElements.sorted { $0.value.count > $1.value.count}
        let result = sorted.first?.value.first
        return result
    }
}

