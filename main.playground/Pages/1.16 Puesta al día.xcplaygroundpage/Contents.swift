//: [Previous](@previous)

import Foundation

/**

 - En Swift también hay genéricos, como en otros lenguajes como Java
 - Todo puede ser genérico: clases, structs, enums e incluso funciones

 */

enum Opcional<T> {
    case valor(T)
    case nulo
}

func peticionAlServidor(url: String) -> Opcional<String> {
    let success = false

    return success ? .valor("ok") : .nulo
}

//: [Next](@next)
