//: [Previous](@previous)

import Foundation

/**

 - Opcionales
 - Los opcionales son parte del sistema de tipos de Swift
 - En vez de comprobar un valor especial, como null o nil, tenemos variables que pueden o no
   contener valor

 */

struct Cliente {
    // Campos Versión 1.0
    let nombre: String
    let email: String
    // En la versión 1.1 se añadió el teléfono. Los registros de la versión 1 no tienen teléfono
    let telefono: String?
}

// Hay que extraer el valor de los campos opcionales:

let clienteV1 = Cliente(nombre: "Isabel Pantoja", email: "isabel@pantoja.es", telefono: nil)
let clienteV2 = Cliente(nombre: "Kiko Rivera", email: "kiko@rivera.es", telefono: "555-123123")

// Normalmente se extrae con if let ... en variables se usa el mismo nombre
func imprimirTelefono(cliente: Cliente) {
    let telefonoV1 = cliente.telefono
    if let telefonoV1 = telefonoV1 {
        print("El cliente tiene teléfono: \(telefonoV1)")
    } else {
        print("El cliente no tiene teléfono")
    }
}

imprimirTelefono(cliente: clienteV1)
imprimirTelefono(cliente: clienteV2)

// Aunque también se puede usar el nil-coalescing operator:
func imprimirTelefonoV2(cliente: Cliente) {
    let telefono = cliente.telefono ?? "No disponible"
    print("Teléfono: \(telefono)")
}

imprimirTelefonoV2(cliente: clienteV1)
imprimirTelefonoV2(cliente: clienteV2)

// Se pueden encadenar opcionales, por ejemplo si tuviéramos estructuras anidadas
// let firma = cuentaActual.preferencias.firma?.texto
// firma puede tener valor o ser nulo

// Si sabemos que un opcional siempre va a tener valor, podemos usar el forzado de opcionales
let telefono = clienteV2.telefono!
// Si intentamos acceder a un teléfono que no tenga valor, tendremos un cierre

//: [Next](@next)
