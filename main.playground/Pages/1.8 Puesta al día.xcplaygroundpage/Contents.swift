//: [Previous](@previous)

import Foundation

/**

 - Por defecto, a las funciones se las invoca con el nombre del parámetro por claridad
 - Se pueden poner etiquetas externas para los parámetros. De esta forma se puede usar
   una etiqueta cuando se invoca y usar un nombre de parámetro en la función
 - Por ejemplo, se usa mucho en los frameworks de Apple
 - También se pueden ignorar las etiquetas de los argumentos

 */

func multiplicar(_ numero: Int, por factor: Int) -> Int {
    return numero * factor
}

let total = multiplicar(3, por: 6)

// Se pueden poner valores por defecto a los parámetros
// Generalmente se ponen al final

func calcularCosteProyecto(horas: Double, precio: Double = 15.0) -> Double {
    return horas * precio
}

let costeProyectoNormal = calcularCosteProyecto(horas: 80.0)
let costeProyectoUrgente = calcularCosteProyecto(horas: 40.0, precio: 25.0)

//: [Next](@next)
