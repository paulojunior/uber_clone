//
//  EntrarViewController.swift
//  uber
//
//  Created by Junior Ferreira on 23/08/21.
//

import UIKit
import FirebaseAuth

class EntrarViewController: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    
    @IBAction func entrar(_ sender: Any) {
        
        let retorno = self.validarCampos()
        
        if retorno == "" {
            let autenticacao = Auth.auth()
            autenticacao.signIn(withEmail: self.email.text!, password: self.senha.text!, completion: { (usuario, erro) in
                
                if erro == nil {
                    if usuario != nil {
                        self.performSegue(withIdentifier: "segueLogin", sender: nil)
                    }
                } else {
                    print("Erro ao autenticar o usuário, tente novamente!")
                }
                
            })
        } else {
            print("O campo \(retorno) não foi preenchido!")
        }
        
    }
    
    func validarCampos() -> String {
        
        if (self.email.text?.isEmpty)! {
            return "E-mail"
        } else if (self.senha.text?.isEmpty)! {
            return "Senha"
        }
        
        return ""
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
