//: [Previous](@previous)

import Foundation

/**

 STRUCTS

 - Generalmente se usan para modelar tipos simples
 - Si no hay ningún constructor, se sintetiza automáticamente
 - Puede tener propiedades, métodos, etc.

 */

struct Cantidad {
    var valor: Double
    var divisa: String

    func sumar(_ cantidad: Cantidad) -> Cantidad {
        return Cantidad(valor: valor + cantidad.valor, divisa: divisa)
    }
}

let total = Cantidad(valor: 100.0, divisa: "EUR")
let iva = Cantidad(valor: 21.0, divisa: "EUR")
let totalConIva = total.sumar(iva)

/**

 EJERCICIO

 Incluir la comprobación de que las monedas sean iguales

 */

//: [Next](@next)
