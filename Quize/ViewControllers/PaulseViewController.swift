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
    var gameFinished = false
    var currentPolse: Queezy?
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = currentPolse?.name
        value = 0
        showCurrentQuestion()
        paulseView.myCollectionView.delegate = self
        paulseView.myCollectionView.dataSource = self
        paulseView.myCollectionView.register(UINib(nibName: "AnswerCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "AnswerCollectionViewCell")
        paulseView.myCollectionView.register(UINib(nibName: "TitleCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "TitleCollectionViewCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addValue()
    }
    private func addValue() {
        if gameFinished != true {
            value += 0.01
        }
        
        
        if value > 1 {
            showAlertWithTitle("Time is over")
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
            self.addValue()
        }
    }
    
    private func showCurrentQuestion() {
        paulseView.myCollectionView.reloadData()
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

extension PaulseViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return (currentPolse?.questions[currentQuestionIndex].answers.count ?? 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section{
        case 0:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "TitleCollectionViewCell",
                for: indexPath
            ) as? TitleCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.titleLabel.text = currentPolse?.questions[currentQuestionIndex].title
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "AnswerCollectionViewCell",
                for: indexPath
            ) as? AnswerCollectionViewCell else {
                
                return UICollectionViewCell()
            }
            cell.titlleLabel.text = currentPolse?.questions[currentQuestionIndex].answers[indexPath.item]
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 50)
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.section > 0
        else {return}
        let answer = currentPolse?.questions[currentQuestionIndex].answers[indexPath.item]
        let correctAnswer = currentPolse?.questions[currentQuestionIndex].rightAnswer
        
        if correctAnswer == answer {
            value = 0
            currentQuestionIndex += 1
            guard currentQuestionIndex < currentPolse!.questions.count else {
                showAlertWithTitle("Congratulations")
                gameFinished = true
                // value = 1
                return
            }
            showCurrentQuestion()
        } else {
            showAlertWithTitle("Wrong")
            value = 1
        }
    }
}
