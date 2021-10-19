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
        
    
}
extension EntryViewController: ReceiverNextButtonTapDelegate {
    func nextButtonTapped(_ sender: UIButton) {
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
