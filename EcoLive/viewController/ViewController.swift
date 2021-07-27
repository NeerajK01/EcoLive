//
//  ViewController.swift
//  EcoLive
//
//  Created by Neeraj kumar on 16/07/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var grayColor: UIView!
    
    @IBOutlet weak var userNameView: UIView!
    @IBOutlet weak var passWordView: UIView!
    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var forgotPassword: UILabel!
    
    @IBOutlet weak var emailTXT: UITextField!
    @IBOutlet weak var passwordTXT: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var email = ""
    var password = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setLayout()
        emailTXT.delegate = self
        passwordTXT.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    func goToSecondScreen(){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(identifier: "LandingViewController") as? LandingViewController
        vc?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func setLayout(){
    greenView.layer.masksToBounds = true
    greenView.layer.cornerRadius = self.greenView.bounds.width / 2
    grayColor.layer.masksToBounds = true
    grayColor.layer.cornerRadius = self.grayColor.bounds.width / 2
    grayColor.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
    
    self.userNameView.layer.masksToBounds = true
    self.userNameView.layer.cornerRadius = self.userNameView.frame.height * 0.5
    self.userNameView.layer.borderWidth = 1
    self.userNameView.layer.borderColor = UIColor.gray.cgColor
    
    self.passWordView.layer.masksToBounds = true
    self.passWordView.layer.cornerRadius = self.passWordView.frame.height * 0.5
    self.passWordView.layer.borderWidth = 1
    self.passWordView.layer.borderColor = UIColor.gray.cgColor
    
    self.loginButton.layer.masksToBounds = true
    self.loginButton.layer.cornerRadius = self.loginButton.frame.height * 0.5
}
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.emailTXT{
            if let text = textField.text,
               let textRange = Range(range, in: text){
                let updatedText = text.replacingCharacters(in: textRange, with: string)
                self.email = updatedText
            }
        }else if textField == self.passwordTXT{
            if let text = textField.text,
               let textRange = Range(range, in: text){
                let updatedText = text.replacingCharacters(in: textRange, with: string)
                self.password = updatedText
            }
        }
        return true
    }
    
    @IBAction func loginAction(_ sender: Any) {
        debugPrint(self.email, self.password)
        if(self.email != "" && self.password != ""){
            ServiceResponse.shared.getData(url: "https://21da8b07-ef4f-4374-86c2-2fdae174ba7d.mock.pstmn.io/v1/login", parameters: ["email":"\(self.email)","password":"\(self.password)"], completion: {
                status in
                if status{
                    DispatchQueue.main.async {
                        self.goToSecondScreen()
                    }
                }
            })
        }else{
            let alert = UIAlertController(title: "Warning", message: "Please Enter Email and Password", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
}
//test@21twelve.com       123456
