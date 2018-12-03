import Foundation

/**

 EJERCICIO:

 Hacer una extensión sobre los números enteros para añadir una función
 que devuelva una String con la representación en números romanos

 I -> 1
 V -> 5
 X -> 10
 L -> 50
 C -> 100
 D -> 500
 M -> 1000

 No se pueden poner más de 3 números romanos seguidos:
 3 -> III
 4 -> IV
 300 -> CCC
 400 -> CD
 etc.

 */

let mapa = [1: "I",
            2: "II"]

//if let variable = mapa[3] {
//}

extension Int {
    func romano() -> [String] {
        return ["X", "X", "V", "I", "I"]
    }
}

27.romano().joined(separator: "")

extension String {
    func asArray() -> [String] {
        return self.map { String($0) }
    }
}

"XXXX".asArray()

let cad1 = "1"
let cad2 = "2"
let concatenation = "\(cad1)\(cad2)"

let tupla = ("1", "X")
let primero = tupla.0
let segundo = tupla.1



