//: [Previous](@previous)

import Foundation

/**

 EXTENSIONES

 - Las extensiones permiten ampliar la funcionalidad de tipos existentes, incluso de tipos
   de los que no tenemos el código o se encuentran en otras librerías y módulos
 - También se usan para cumplimiento de protocolos
 - Se pueden usar en protocolos para añadir implementaciones por defecto

 */

extension String {
    func duplicar() -> String {
        return "\(self)\(self)"
    }
}

protocol Imprimible {
    func imprimir()
}

extension Int: Imprimible {
    func imprimir() {
        print("Entero: \(self)")
    }
}

// Implementación por defecto:
extension Imprimible {
    func imprimir() {
        print(self)
    }
}

// Y para cumplir un protocolo
extension String: Imprimible {}

// Usa la implementación de la extensión de Int
32.imprimir()
// Usa la implementación por defecto de la extensión del protocolo
"hola".imprimir()

//: [Next](@next)
