//
//  ViewController.swift
//  FlashCardApp
//
//  Created by Adam Haji on 9/13/22.
//

import UIKit

class ViewController: UIViewController {

    struct Flashcard {
        var question: String
        var answer: String
    }
    
    var index = 0;
    
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
    
    @IBAction func didTapNext(_ sender: Any) {
        index = index + 1
        updateNextPrevButtons()
        updateLabels()
        
        if question.isHidden {
            answer.isHidden = true
            question.isHidden = false
        }
    }
    
    @IBAction func didTapPrev(_ sender: Any) {
        index = index - 1
        updateNextPrevButtons()
        updateLabels()
        
        if question.isHidden {
            answer.isHidden = true
            question.isHidden = false
        }
    }
    
    func updateLabels() {
        let currentFlashcard = flashcards[index]
        question.text = currentFlashcard.question
        answer.text = currentFlashcard.answer
    }
    
    // Updates the flashcard thats in view
    func update(questionUpdate: String, answerUpdate: String) {
        let flashcard = Flashcard(question: questionUpdate, answer: answerUpdate)
        flashcards.append(flashcard)
        print("Added new flashcard to array, now have \(flashcards.count) cards")
        
        index = flashcards.count - 1
        
        updateNextPrevButtons()
        updateLabels()
        
        if question.isHidden {
            answer.isHidden = true
            question.isHidden = false
        }
        
        saveAllFlashcards()
    }
    
    func readSavedFlashcards() {
        if let dictionaryArray = UserDefaults.standard.array(forKey:"flashcards") as? [[String: String]] {
            
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
            
            flashcards.append(contentsOf: savedCards)
        }
        
    }
    
    // Array for flashcards
    var flashcards = [Flashcard]()
    
    // IOS view loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        readSavedFlashcards()
        
        
        card.layer.cornerRadius = 15.0
        card.clipsToBounds = true
        card.layer.shadowRadius = 10.0
        card.layer.shadowOpacity = 0.3
        
        if flashcards.count == 0 {
            update(questionUpdate: "What is the Capital of Washington?", answerUpdate: "Olympia")
        } else {
            updateLabels()
            updateNextPrevButtons()
        }
    }

    // Method for when you press the flashcard
    @IBAction func didTap(_ sender: Any) {
        // question.isHidden = true
        if answer.isHidden {
            question.isHidden = true
            answer.isHidden = false
        } else {
            answer.isHidden = true
            question.isHidden = false
        }
    }
    
    func updateNextPrevButtons() {
        if index == flashcards.count - 1 {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
        
        if index == 0 {
            prevButton.isEnabled = false
        } else {
            prevButton.isEnabled = true
        }
        
    }
    
    func saveAllFlashcards() {
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question, "answer": card.answer]
        }
        
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
    }
    
    // Logistics?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // We know the destination of the segue is the Navigation Controller
        let navigationController = segue.destination as! UINavigationController
            
        // We know the Navigation Controller only contains a Creation View Controller
        let creationController = navigationController.topViewController as! CreationViewController
        // We set the flashcardsController property to self
        creationController.flashcardController = self
    }
    
}

