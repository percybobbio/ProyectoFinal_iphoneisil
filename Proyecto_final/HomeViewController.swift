//
//  HomeViewController.swift
//  Proyecto_final
//
//  Created by Percy Bobbio on 11/15/20.
//  Copyright © 2020 Percy Bobbio. All rights reserved.
//

import UIKit

enum  Providertype: String {
    case basic
}
class HomeViewController: UIViewController {

    @IBOutlet weak var txtDNI: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnRegistrar: UIButton!
    
    private let email: String
    private let provider: Providertype
    
    init(email: String, provider: Providertype){
        self.email = email
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not benn implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Registrar"
    }
    
    @IBAction func registerbtnAccion(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
