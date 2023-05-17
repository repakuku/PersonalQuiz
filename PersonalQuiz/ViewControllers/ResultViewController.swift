//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Алексей Турулин on 5/15/23.
//

import UIKit

final class ResultViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    // MARK: - Properties
    var answerChosen: [Answer]!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        showResultAnimal()
    }
    
    // MARK: - IBActions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("ResultViewController is deallocated")
    }
}

//MARK: - Private Methods
private extension ResultViewController {
    func showResultAnimal() {
        var animalCount: [Animal: Int] = [:]
        
        for answer in answerChosen {
            animalCount[answer.animal] = (animalCount[answer.animal] ?? 0) + 1
        }
        
        let sortedAnimalCount = animalCount.sorted { $0.value > $1.value }
        guard let resultAnimal = sortedAnimalCount.first?.key else { return }
        
        updateUI(with: resultAnimal)
    }
    
    func updateUI(with animal: Animal) {
        animalLabel.text = "Вы - \(animal.rawValue)"
        definitionLabel.text = animal.definition
    }
}
 

