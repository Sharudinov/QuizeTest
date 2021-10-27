//
//  ViewController.swift
//  Quize
//
//  Created by Мурад on 29.08.2021.
//

import UIKit

class EntryViewController: UIViewController {

    private var entryView: EntryView {
        return view as! EntryView
    }
    private let toMainVCIdentifier = "toMainViewControllerSegue"
   
    override func viewDidLoad() {
        super.viewDidLoad()
     //   entryView.userNameTextField.delegate = self
        entryView.delegate = self
    //    entryView.userNameTextField.becomeFirstResponder()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let _  = touches.first else { return }
        
        entryView.userNameTextField.resignFirstResponder()
    }
  //  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    private func showAlertWithText(_ title: String){
        let alertControllerr = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        let okActionn = UIAlertAction(title: "Меньше 4 символов", style: .cancel){
            [weak self] (_) in self?.navigationController?.popViewController(animated: true)
        }
        alertControllerr.addAction(okActionn)
        present(alertControllerr, animated: true, completion: nil)
    }
    
}

extension EntryViewController: ReceiverNextButtonTapDelegate {
    func nextButtonTapped(_ sender: UIButton) {
        guard let text = entryView.userNameTextField.text , !text.isEmpty , text.count > 3 else {
            
            showAlertWithText("Ошибка")
            return
        }
        Singleton.shared.userName = text
        performSegue(withIdentifier: toMainVCIdentifier, sender: sender)
        
    }
}
extension EntryViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Ended: " + (textField.text ?? ""))
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Beginned: " + (textField.text ?? ""))
    }
}
