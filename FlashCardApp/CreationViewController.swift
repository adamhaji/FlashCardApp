//
//  CreationViewController.swift
//  FlashCardApp
//
//  Created by Adam Haji on 10/3/22.
//

import UIKit

class CreationViewController: UIViewController {
    
    var flashcardController: ViewController!
    
    @IBOutlet weak var questionUpdate: UITextField!
    @IBOutlet weak var answerUpdate: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapApply(_ sender: Any) {
        
        let question = questionUpdate.text
        let answer = answerUpdate.text
        
        flashcardController.update(questionUpdate: question!, answerUpdate: answer!)
        
        dismiss(animated: true)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
