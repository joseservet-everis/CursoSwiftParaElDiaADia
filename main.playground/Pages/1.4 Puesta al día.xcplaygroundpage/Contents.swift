//: [Previous](@previous)

import Foundation

/**

 - Además de los tipos básicos, en Swift también existen los rangos y las tuplas
 - Un rango es un conjunto de valores desde un mínimo hasta un máximo
 - Una tupla es un conjunto de variables, una especie de diccionario

 */

let rangoCerrado = 1...4    // 1 a 4, inclusive
let rangoAbierto = 1..<4    // 1 hasta el anterior al 4

let tupla = (1, "uno")
let primerElemento = tupla.0
let segundoElemento = tupla.1

/**

 - Los rangos se usan para varias cosas:
    - Bucles
    - Inicializar arrays
    - Definir subarrays
 - Las tuplas se utilizan principalmente para devolver varios valores de una función,
   aunque se pueden utilizar como cualquier otro tipo, diccionario, etc.

 */

/**
 - Como curiosidad, las cadenas en Swift pueden manejar emojis sin problemas
 - Incluso podemos usar emojis como identificadores de variables
 */

let vaca = "🐮"
let pollo = "🐔"
let 🐮 = vaca
let 🐔 = pollo
let serieDeDibujos = [🐮, 🐔]
//: [Next](@next)
