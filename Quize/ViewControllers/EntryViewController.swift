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
            /* NotificationCenter.default.addObserver(
        self,
        selector: #selector(self.keyboardWillShow(_:)),
        name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(
        self,
        selector: #selector(self.keyboardWillHide(_:)),
        name: UIResponder.keyboardWillHideNotification, object: nil)
*/
        

       
        
        
    

     //   entryView.userNameTextField.delegate = self
        entryView.delegate = self
    }
    //    entryView.userNameTextField.becomeFirstResponder()
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let _  = touches.first else { return }
        
        entryView.userNameTextField.resignFirstResponder()
    }
  //  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    private func showAlertWithText() {
        let alertController = UIAlertController(title: title, message: "Введено имя меньше 4 символов", preferredStyle: .actionSheet)
        let okActionn = UIAlertAction(title: "OK", style: .default){
            [weak self] (_) in self?.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(okActionn)
        present(alertController, animated: true, completion: nil)
    }
private func keyboardWillShow(notification: Notification) {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
        print("notification: Keyboard will show")
        if self.view.frame.origin.y == 0{
            self.view.frame.origin.y -= keyboardSize.height
        }
    }

}

    @objc private func keyboardWillHide(notification: Notification) {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y += keyboardSize.height
        }
    }
}
}
extension EntryViewController: ReceiverNextButtonTapDelegate {
    func nextButtonTapped(_ sender: UIButton) {
        guard let text = entryView.userNameTextField.text , !text.isEmpty , text.count > 3 else {
            
            showAlertWithText()
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

