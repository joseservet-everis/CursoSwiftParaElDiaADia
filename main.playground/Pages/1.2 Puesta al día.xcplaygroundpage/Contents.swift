//: [Previous](@previous)

import Foundation

/**

 - En Swift se distingue entre variables y constantes
 - Las constantes no se pueden modificar
 - La mayoría de las veces es mejor usar constantes por seguridad
 - Lo único que diferencia una variable de una constante es que se definen con let en vez de var

 */

let pi = 3.14

// Los enteros se pueden definir en hexadecimal, binario u octal usando un prefijo

let hexadecimal = 0xDEADBEEF
let octal = 0o744
let binario = 0b10001000

// Además, en Swift se pueden usar separadores _ en los dígitos, que no influyen en el valor
// Hacen mucho más fácil leer y escribir el valor

let dosMillones = 2_000_000
let cuatroMillones = dosMillones * 2

// Por defecto en Swift se comprueban los límites para evitar overflows
// Este comportamiento es distinto al de Java o C, en el que el overflow es la norma

// Esta sentencia provoca un crash
//let cuatroMillonesAlCubo = cuatroMillones * cuatroMillones * cuatroMillones
// Para permitir overflows, hay otros operadores que lo contemplan
let cuatroMillonesAlCuboOverflow = cuatroMillones &* cuatroMillones &* cuatroMillones
//: [Next](@next)
