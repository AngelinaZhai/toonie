//
//  SignupViewController.swift
//  toonie
//
//  Created by Angelina Zhai on 2022-09-23.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet var email: UITextField!
    @IBOutlet var pw: UITextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
}
