//: [Previous](@previous)

import Foundation

/**

 PROTOCOLOS

 - Los protocolos son una de las partes más potentes de Swift
 - Son como los interfaces de Java
 - Permiten separar la implementación del tipo que la implementa. Cualquier tipo puede
   implementar un protocolo

 */

protocol Imprimible {
    func imprimir()
}

class Documento: Imprimible {
    let titulo: String
    let texto: String

    init(titulo: String, texto: String) {
        self.titulo = titulo
        self.texto = texto
    }

    func imprimir() {
        print("\(titulo): \(texto)")
    }
}

//: [Next](@next)
