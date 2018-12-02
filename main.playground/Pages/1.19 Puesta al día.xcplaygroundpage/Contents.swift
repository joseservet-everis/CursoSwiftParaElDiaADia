//: [Previous](@previous)

import Foundation

/**

 switch

 - La sentencia switch de Swift es muy potente y versátil
 - No es como en Java o C que son casos muy concretos, como un valor entero
 - En Swift usa pattern matching y se puede usar para varias cosas:
    - Tipos
    - Rangos
    - Tuplas
    - Constantes
    - etc.
 - Debe ser exhaustivo y contemplar cada caso
 - No es necesario poner break al final de cada caso, ya que no siguen en el siguiente caso.
   Solo hay que ponerlo en el caso de que el caso esté vacío
 - Si queremos que siga, tenemos que poner explicitamente fallthrough

 */

switch (4, "hola") {
case is String:
    print("Soy una cadena")
case (1..<3, _):
    print("Soy menor que 3")
case (_, "taza"):
    print("Soy una taza")
case (4, "x"): fallthrough
case (5, "hola"):
    print("Casos específicos")
default:
    break
}

//: [Next](@next)
