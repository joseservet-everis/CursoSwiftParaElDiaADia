//: [Previous](@previous)

import Foundation

/**

 - En Swift se puede programar se puede programar de forma orientada a objetos e imperativa
   o funcional
 - En programación funcional, las funciones son un tipo más del lenguaje, y podemos tener
   variables de tipo función, argumentos de tipo función, etc.
 - Aparte de otras cosas como inmutabilidad, evitar efectos colaterales o reproducibilidad,
   la programación funcional tiende a ser más declarativa, decimos qué vamos a hacer en vez de
   cómo lo hacemos
 - Es mucho más flexible
 - filter, map, reduce son ejemplos de funciones que reciben una función por parámetro
 - En Swift, los bloques de código se llaman Closures. Son como los bloques en Objective-C o
   los lambdas en Java 8 o C++

 */

typealias Funcion = (Int) -> Int

func mapeo(valor: Int, funcion: Funcion) -> Int {
    return funcion(valor)
}

// Veamos el ejercicio anterior de forma funcional y declarativa
let valores = 1...10
let literales = ["uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho", "nueve", "diez"]

let textos = zip(valores, literales)    // secuencia de tuplas (1, "uno"), (2, "dos"), etc.
    .filter({ (indice, _) in return (indice % 2 != 0) }) // dejamos solo los impares
    .map({ (_, literal) in return literal }) // obtenemos el segundo campo de la tupla
    .reversed()                             // invertimos la secuencia

let textosComoArray = Array(textos)

// Usando syntactic sugar de Swift lo podemos dejar más compacto
let abreviado = zip(valores, literales)    // secuencia de tuplas (1, "uno"), (2, "dos"), etc.
    .filter { $0.0 % 2 != 0 }   // trailing closure, shorthand arguments, implicit return
    .map { $0.1 }   // trailing closure, shorthand arguments, implicit return
    .reversed()     // invertimos la secuencia

// Trailing closure syntax: Cuando el último parámetro de la función es otra función, podemos
//   omitir los paréntesis de llamada y poner directamente la closure
// Shorthand arguments: Cuando una closure recibe parámetros, $0 se refiere al primer parámetro,
//   $1 al segundo, etc. En este caso el primer parámetro es una tupla, por eso usamos $0.0 y $0.1
// Implicit return: Cuando una closure solo tiene una sentencia y devuelve un valor, se puede
//   omitir la palabra return, la closure devuelve el resultado de esa sentencia
//: [Next](@next)
