//
//  PaulseViewController.swift
//  Quize
//
//  Created by Мурад on 14.09.2021.
//

import UIKit

class PaulseViewController: UIViewController {
    var paulseView: PaulseView {
        view as! PaulseView
    }
    var value: Double = 0 {
        didSet {
            self.paulseView.progressView.updateProgress(self.value)
            
        }
    }

    var currentPolse: Queezy?
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paulseView.delegate = self

        title = currentPolse?.name
        value = 0
        showCurrentQuestion()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addValue()
    }
    private func addValue() {
            value += 0.01

            if value > 1 {
                showAlertWithTitle("Time is over")
                return
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                
                self.addValue()
            }
        }
    private func showCurrentQuestion() {
        
        guard let question = currentPolse?.questions[currentQuestionIndex] else {return}
        paulseView.titlleLabel.text = question.title
        paulseView.answerButton.enumerated() .forEach { index, button in
            button.setTitle(question.answers[index], for: [])
        }
    }
    private func showAlertWithTitle(_ title: String) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "OK", style: .default) {
            [weak self] (_) in
            self?.navigationController?.popViewController(animated: true)
            
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
extension PaulseViewController: PaulseViewAnswerSelectionDelegate {
    func buttonDidTap(_ string: String) {
        guard let question = currentPolse?.questions[currentQuestionIndex] else {return}
        if question.rightAnswer == string {
            value = 0
            currentQuestionIndex += 1
            guard currentQuestionIndex < currentPolse!.questions.count else {
                showAlertWithTitle("Congradulations")
                value = 1
                return
            }
            showCurrentQuestion()
        } else {
          showAlertWithTitle("Wrong")
            value = 1
        }
    }
    
    
}
