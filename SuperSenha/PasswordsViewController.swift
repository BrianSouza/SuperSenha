//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Brian Diego De Souza on 10/10/19.
//  Copyright © 2019 Brian Diego De Souza. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController {

   
    @IBOutlet weak var tvPasswords: UITextView!
    var numberOfCharacters: Int = 10
    var numberOfPasswords: Int = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    
    var passwordsGenerator: PasswordsGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Total de senha: \(numberOfPasswords)"
        
        passwordsGenerator = PasswordsGenerator(numberOfCharacters: numberOfCharacters, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useSpecialCharacters)
        
        generatePasswords()
        
    }
    
    func generatePasswords(){
        tvPasswords.scrollRangeToVisible(NSRange(location: 0,length: 0))
        tvPasswords.text = ""
        
        let passwords = passwordsGenerator.generate(total: numberOfPasswords)
        for password in passwords{
            tvPasswords.text.append(password + "\n\n")
        }
    }
    
    @IBAction func Generate(_ sender: UIButton) {
        generatePasswords()
       }

}
