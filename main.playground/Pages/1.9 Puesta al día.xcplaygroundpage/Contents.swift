//: [Previous](@previous)

import Foundation

/**

 - En Swift podemos definir nuestros propios tipos de datos
 - Dependiendo de si queremos semántica de valor o semántica de referencia, se hace de forma distinta

 - Los tipos que hemos visto hasta ahora (escalares, colecciones, enums) tienen semántica de valor
 - Esto significa que cuando pasamos un valor por parámetro, o asignamos una variable,
   se crea una copia de esa variable
 - Es más seguro en entornos multithread
 - Para definir un tipo con semántica de valor, usamos un struct

 - Los tipos con semántica de referencia trabajan sobre una referencia, lo que implica que
   podemos estar modificando la misma instancia desde dos puntos distintos
 - Es más inseguro porque podemos modificar algo que no estamos esperando
 - Es más rápido porque no hay que hacer una copia de los datos, y podemos modificar el estado
 - Para definir un tipo con semántica de referencia, usamos una clase
 - En clases podemos usar herencia

 - Los arrays y diccionarios, se consideran tipos con semántica de valor, aunque realmente
   pasan referencias para no penalizar el rendimiento
 - Usan copy-on-write: cuando se modifica un array o diccionario es cuando realmente se crea
   la copia del tipo

 */

//: [Next](@next)
