//
//  ViewController.swift
//  Practica11JesusE
//
//  Created by Alumno on 11/1/21.
//  Copyright © 2021 Alumno. All rights reserved.
//

import UIKit

class ListaContactoController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var contactos : [Contacto] = []

    @IBOutlet weak var tvContactos: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaContacto") as! CeldaContactoController
        celda.lblNombre.text = contactos[indexPath.row].nombre
        celda.lblCorreo.text = contactos[indexPath.row].correo
        celda.lblNumero.text = contactos[indexPath.row].numero

        
        return celda
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let contactoSeleccionado = contactos[tvContactos.indexPathForSelectedRow!.row]
        let destino = segue.destination as! EditarContactoController
        destino.contacto = contactoSeleccionado
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Contactos"
        
        contactos.append(Contacto(nombre: "Jesus", correo: "Jesus@gmail.com", numero: "64440000"))
        contactos.append(Contacto(nombre: "Mora", correo: "Mora@gmail.com", numero: "64440000"))
        contactos.append(Contacto(nombre: "Alberto", correo: "Alberto@gmail.com", numero: "64440000"))
    }

    

}

