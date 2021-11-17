//
//  viewController.swift
//  Practica11JesusE
//
//  Created by Alumno on 11/3/21.
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
        return 120
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToEdicion"{
            let contactoSeleccionado = contactos[tvContactos.indexPathForSelectedRow!.row]
            let destino = segue.destination as! EditarContactoController
            destino.contacto = contactoSeleccionado
            destino.indice = tvContactos.indexPathForSelectedRow!.row
            destino.callbackActualizarTablaContactos = actualizarTablaContactos
            destino.callbackEliminarContacto = eliminarContacto
        }
        
        if segue.identifier == "goToCreacion"{
            let destino = segue.destination as! AgregarContactoController
            destino.callbackAgregarContacto = agregarContacto
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Contactos"
        
        contactos.append(Contacto(nombre: "Jesus", correo: "Jesus@gmail.com", numero: "64440000"))
        contactos.append(Contacto(nombre: "Mora", correo: "Mora@gmail.com", numero: "64440000"))
        contactos.append(Contacto(nombre: "Alberto", correo: "Alberto@gmail.com", numero: "64440000"))
    }

    func actualizarTablaContactos() {
        tvContactos.reloadData()
    }
    
    func eliminarContacto(indice : Int) {
        contactos.remove(at: indice)
        actualizarTablaContactos()
    }
    
    func agregarContacto(contacto: Contacto) {
        contactos.append(contacto)
        actualizarTablaContactos()
    }

}

