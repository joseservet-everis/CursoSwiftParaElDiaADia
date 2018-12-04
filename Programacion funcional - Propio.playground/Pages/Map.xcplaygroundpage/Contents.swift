//: [Previous](@previous)

import Foundation

let cadenas = ["hola", "adios", "qué tal", "hi", "sayonara"]
let longitudes = cadenas.map { $0.count }

func mapear(elementos: [String], mapeo: (String) -> Int) -> [Int] {
    var resultado: [Int] = []

    for elemento in elementos {
        resultado.append(mapeo(elemento))
    }

    return resultado
}

func longitud(cadena: String) -> Int {
    return cadena.count
}

let longitudes2 = mapear(elementos: cadenas, mapeo: longitud)

func mapearGenerico<T,U>(elementos: [T], mapeo: (T) -> U) -> [U] {
    var resultado: [U] = []

    for elemento in elementos {
        resultado.append(mapeo(elemento))
    }

    return resultado
}

let longitudes3 = mapearGenerico(elementos: cadenas, mapeo: longitud)
let duplicados = mapearGenerico(elementos: cadenas, mapeo: { "\($0)\($0)" })


struct Cliente {
    let nombre: String
    let email: String?
}

let clientes = [Cliente(nombre: "Isabel Pantoja", email: nil),
                Cliente(nombre: "Kiko Rivera", email: "kiko@rivera.es")]
let emails = clientes.map { $0.email }
print(emails)

//: [Next](@next)
