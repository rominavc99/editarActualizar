//
//  AgregarContactoController.swift
//  Practica11JesusE
//
//  Created by Alumno on 11/8/21.
//  Copyright © 2021 Alumno. All rights reserved.
//

import Foundation
import UIKit

class AgregarContactoController : UIViewController{
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtCelular: UITextField!
    
    var callbackAgregarContacto : ((Contacto) -> Void)?
    
    override func viewDidLoad() {
        self.title = "Agregar contacto"
    }
    
    @IBAction func doTapGuardar(_ sender: Any) {
        let nombre = txtNombre.text!
        let correo = txtCorreo.text!
        let celular = txtCelular.text!
        
        let contacto = Contacto(nombre: nombre, correo: correo, numero: celular)
        callbackAgregarContacto!(contacto)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
