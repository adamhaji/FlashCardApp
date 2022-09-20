//
//  ViewController.swift
//  FlashCardApp
//
//  Created by Adam Haji on 9/13/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var card: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        card.layer.cornerRadius = 15.0
        card.clipsToBounds = true
        card.layer.shadowRadius = 10.0
        card.layer.shadowOpacity = 0.3
    }

    @IBAction func didTap(_ sender: Any) {
        // question.isHidden = true
        if (answer.isHidden) {
            question.isHidden = true
            answer.isHidden = false
        } else {
            answer.isHidden = true
            question.isHidden = false
        }
    }
    
    
    
}
