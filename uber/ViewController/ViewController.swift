//
//  ViewController.swift
//  uber
//
//  Created by Junior Ferreira on 23/08/21.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let autenticacao = Auth.auth()
        autenticacao.addStateDidChangeListener { autenticacao, usuario in
            
            if let usuarioLogado = usuario {
                self.performSegue(withIdentifier: "segueLoginPrincipal", sender: nil)
            }
            
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
