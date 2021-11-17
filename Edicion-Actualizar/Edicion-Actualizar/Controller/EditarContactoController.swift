//
//  EditarContactoController.swift
//  Practica11JesusE
//
//  Created by Alumno on 11/3/21.
//  Copyright © 2021 Alumno. All rights reserved.
//

import Foundation
import UIKit

class EditarContactoController : UIViewController{
    
    var indice : Int = -1
    var contacto : Contacto?
    var callbackActualizarTablaContactos : (() -> Void)?
    var callbackEliminarContacto : ((Int) -> Void)?
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtCelular: UITextField!
    
    override func viewDidLoad() {
        self.title = "Editar contacto"
        
        txtNombre.text = contacto!.nombre
        txtCorreo.text = contacto!.correo
        txtCelular.text = contacto!.numero
    }
    
    @IBAction func doTapGuardar(_ sender: Any) {
        contacto!.nombre = txtNombre.text!
        contacto!.correo = txtCorreo.text!
        contacto!.numero = txtCelular.text!
        
        callbackActualizarTablaContactos!()
    }
    @IBAction func doTapEliminar(_ sender: Any) {
        callbackEliminarContacto!(indice)
        self.navigationController!.popViewController(animated: true)
    }
    
}
