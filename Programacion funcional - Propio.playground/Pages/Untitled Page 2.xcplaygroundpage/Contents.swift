//: [Previous](@previous)

import Foundation

struct Cliente {
    let nombre: String
    let email: String?
}

func compactar(elementos: [Cliente], mapeo: (Cliente) -> String?) -> [String] {
    return []
}

let entrada = [Cliente(nombre: "Isabel", email: nil),
               Cliente(nombre: "Kiko", email: "kiko@rivera.es")]
let salida = ["kiko@rivera.es"]

//: [Next](@next)
