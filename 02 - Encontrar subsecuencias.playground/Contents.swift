
import UIKit

/*
 *  Ejercicio: saber si una cadena contiene una subcadena
 *
 *  El trabajo con cadenas de texto es engorroso en Swift, así que podemos tratar una cadena como un array de caracteres
 */

func convertirASecuencia(string: String) -> [String] {
    return string.characters.map { String($0) }
}

func contieneSubcadena(string: String, substring: String) -> Bool {
    let secuencia = convertirASecuencia(string: string)
    let subsecuencia = convertirASecuencia(string: substring)
    
    return contieneSubsecuencia(secuencia: secuencia, subsecuencia: subsecuencia)
}

func contieneSubsecuencia(secuencia: [String], subsecuencia: [String]) -> Bool {
    guard subsecuencia.count <= secuencia.count else {
        return false
    }
    
    guard let primero = subsecuencia.first else {
        return true
    }
    
    let candidatos = secuencia.enumerated().filter { $0.element == primero }
    guard !candidatos.isEmpty else {
        return false
    }
    
    let longitudSecuencia = secuencia.count
    let longitudSubsecuencia = subsecuencia.count
    let posiblesSubsecuencias = candidatos
        .filter { ($0.offset + longitudSubsecuencia) <= longitudSecuencia }
        .map { secuencia[$0.offset..<$0.offset + longitudSubsecuencia] }
    
    return posiblesSubsecuencias.reduce(false) {
        isContained, secuenciaTestada in
        
        return isContained || subsecuencia.elementsEqual(secuenciaTestada)
    }
}

let prueba1 = contieneSubcadena(string: "subcadena", substring: "cadena")
let prueba2 = contieneSubcadena(string: "subcaden", substring: "cadena")
let prueba3 = contieneSubcadena(string: "texto, texto, texto", substring: "text")

func subsecuencias(string: String, substring: String) -> [Int] {
    let secuencia = convertirASecuencia(string: string)
    let subsecuencia = convertirASecuencia(string: substring)
    
    return indicesSubsecuencia(secuencia: secuencia, subsecuencia: subsecuencia)
}

func indicesSubsecuencia<T: Equatable>(secuencia: [T], subsecuencia: [T]) -> [Int] {
    guard subsecuencia.count <= secuencia.count else {
        return []
    }
    
    guard let primero = subsecuencia.first else {
        return secuencia.enumerated().map { $0.offset }
    }
    
    let candidatos = secuencia.enumerated().filter { $0.element == primero }
    guard !candidatos.isEmpty else {
        return []
    }
    
    let longitudSecuencia = secuencia.count
    let longitudSubsecuencia = subsecuencia.count
    return candidatos
        .filter { ($0.offset + longitudSubsecuencia) <= longitudSecuencia }
        .map { ($0.offset, secuencia[$0.offset..<$0.offset + longitudSubsecuencia]) }
        .filter { subsecuencia.elementsEqual($0.1) }
        .map { $0.0 }
}

let seq1 = subsecuencias(string: "subcadena", substring: "cadena")
let seq2 = subsecuencias(string: "subcaden", substring: "cadena")
let seq3 = subsecuencias(string: "texto, texto, texto", substring: "text")