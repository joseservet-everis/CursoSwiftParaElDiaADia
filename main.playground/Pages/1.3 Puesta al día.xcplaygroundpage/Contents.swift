//: [Previous](@previous)

import Foundation

/**

 - La sintaxis para definir el tipo array es poniendo el tipo de los elementos entre corchetes,
 los elementos se separan por comas.
 - La sintaxis para definir el tipo diccionario es poniendo el tipo de la clave y el tipo
 del valor entre corchetes, separados por : y cada elemento se separa por comas
 - En Swift, los arrays y los diccionarios pueden contenter cualquier tipo, no están limitados
 a objetos como en Java u Objective-C

 */

let pares: [Int] = [2, 4, 6, 8]
let literales: [Int: String] = [2: "dos",
                                4: "cuatro",
                                6: "seis",
                                8: "ocho"]

// El tipo de los arrays y los diccionarios también se pueden inferir a partir del contenido
// El único caso en que no se pueden inferir y es necesario especificar el tipo es para
// arrays y diccionarios vacíos

let impares = [1, 3, 5, 7, 9]
let temas = ["uno": "Introducción",
             "dos": "Ejercicios"]
var temasCompletados: [String] = []

//: [Next](@next)
