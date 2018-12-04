//: [Previous](@previous)

import Foundation

let enteros = [1, 2, 3, 4]
let suma = enteros.reduce(0) { $0 + $1 }
let suma2 = enteros.reduce(0, +)
print(suma)

func reducir(elementos: [Int], valorInicial: Int, reduccion: (Int, Int) -> Int) -> Int {
    var valor = valorInicial

    for elemento in elementos {
        valor = reduccion(valor, elemento)
    }

    return valor
}

let sumaReducida = reducir(elementos: enteros, valorInicial: 5, reduccion: { $0 + $1 })
print(sumaReducida)

func reducirGenerico<T,U>(elementos: [T], valorInicial: U, reduccion: (U, T) -> U) -> U {
    var valor = valorInicial

    for elemento in elementos {
        valor = reduccion(valor, elemento)
    }

    return valor
}

let cadenas = ["hola", "adios", "hi", "sayonara"]
let longitud = reducirGenerico(elementos: cadenas, valorInicial: 0, reduccion: { $0 + $1.count })
print(longitud)

//: [Next](@next)
