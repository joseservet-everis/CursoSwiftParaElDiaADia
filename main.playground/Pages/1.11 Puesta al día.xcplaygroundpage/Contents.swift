//: [Previous](@previous)

import Foundation

/**

 CLASES

 - Generalmente se usan para modelar tipos más complejos, con estado
 - Hay que poner un constructor explícito
 - Puede tener propiedades, métodos, igual que los structs

 */

class Cantidad {
    var valor: Double
    var divisa: String

    init(valor: Double, divisa: String) {
        self.valor = valor
        self.divisa = divisa
    }

    func sumar(_ cantidad: Cantidad) -> Cantidad {
        return Cantidad(valor: valor + cantidad.valor, divisa: divisa)
    }
}

let total = Cantidad(valor: 100.0, divisa: "EUR")
let iva = Cantidad(valor: 21.0, divisa: "EUR")
let totalConIva = total.sumar(iva)

//: [Next](@next)
