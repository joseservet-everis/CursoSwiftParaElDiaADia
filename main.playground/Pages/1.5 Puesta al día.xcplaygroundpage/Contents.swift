//: [Previous](@previous)

import Foundation

/**

 - Swift también tiene enums. Se pueden usar como los enums típicos en C o Java
 - En Swift, un enum también puede tener valores escalares como enteros, flotantes o cadenas

 */

enum ModelosDeiPhoneConFaceId {
    case iPhoneX
    case iPhoneXS
    case iPhoneXSMax
    case iPhoneXR
}

enum CodigosHTTP: Int {
    case ok = 200
    case forbidden = 403
    case urlNotFound = 404
    case internalError = 500
}

enum Radianes: Double {
    case noventa = 1.57
    case cientoOchenta = 3.14
    case doscientosSetenta = 4.71
    case trescientosSesenta = 6.28
}

enum MensajesDeError: String {
    case ok = "ok"
    case forbidden = "Acceso prohibido"
    case urlNotFound = "Recurso no encontrado"
}

let modeloMasAntiguo = ModelosDeiPhoneConFaceId.iPhoneX
let codigoNoEncontrado = CodigosHTTP.urlNotFound
// Los enums que tienen un tipo base, tienen un método rawValue para poder acceder al valor
let codigoOk = CodigosHTTP.ok.rawValue

/**
 - Lo que es más potente de los enums es que cada caso puede tener valores asociados
 - Semánticamente es más correcto modelar los datos
 */

enum Estado {
    case noConectado
    case conectado
    case errorDeConexion(CodigosHTTP)
}

// De esta forma, SOLO se pasa el código del error en caso de que el estado sea errorDeConexion
// Así no necesitamos tener una variable para el estado y una variable para el código de error

let noEncontrado = Estado.errorDeConexion(CodigosHTTP.urlNotFound)
// O abreviado, ya que sabemos que el tipo asociado es un enum CodigosHTTP
let prohibido = Estado.errorDeConexion(.forbidden)
// Y si tenemos el tipo de la variable, aun podemos abreviar más
let estado: Estado = .errorDeConexion(.internalError)
//: [Next](@next)
