
import UIKit

/*
 *  En programación funcional, se utilizan las funciones como parámetros o valores que se devuelven
 *  De esta forma, se pueden crear funciones más complejas por composición de funciones más sencillas
 *
 *  Un ejemplo es un validador de emails. Vamos a poner algunas reglas:
 *
 *  - La longitud de la cadena debe ser mayor a 9 caracteres
 *  - Debe contener un simbolo @
 *  - No puede contener espacios
 *
 *  Vamos a crear pequeños validadores para cada una de las reglas
 */

func validarLongitud(_ string: String) -> Bool {
    return string.characters.count >= 9
}

func validarArroba(_ string: String) -> Bool {
    if let _ = string.range(of: "@") {
        return true
    }
    
    return false
}

func validarEspacios(_ string: String) -> Bool {
    if let _ = string.range(of: " ") {
        return false
    }
    
    return true
}

func validarEmail(_ string: String) -> Bool {
    return validarLongitud(string) &&
        validarArroba(string) &&
        validarEspacios(string)
}

validarEmail("test@test.com")
validarEmail("fallo en test.com")

/*
 *  Problemas con este enfoque:
 *  - No es fácil de componer
 *  - No sabemos todos los posibles errores de una cadena
 *
 *  Vamos a cambiar la forma de hacerlo:
 */

enum Validez {
    case noValidado
    case valido
    case invalido(errores: [String])
}

struct CadenaValidada {
    let cadena: String
    let validez: Validez
    
    init(cadena: String) {
        self.init(cadena: cadena, validez: .noValidado)
    }
    
    init(cadena: String, validez: Validez) {
        self.cadena = cadena
        self.validez = validez
    }
    
    func validar() -> CadenaValidada {
        switch validez {
        case .noValidado:
            return CadenaValidada(cadena: cadena, validez: .valido)
        case .valido:
            return CadenaValidada(cadena: cadena, validez: .valido)
        case .invalido:
            return self
        }
    }
    
    func invalidar(error: String) -> CadenaValidada {
        switch validez {
        case .noValidado:
            return CadenaValidada(cadena: cadena, validez: .invalido(errores: [error]))
        case .valido:
            return CadenaValidada(cadena: cadena, validez: .invalido(errores: [error]))
        case .invalido(let errores):
            var erroresMutables = errores
            erroresMutables.append(error)
            return CadenaValidada(cadena: cadena, validez: .invalido(errores: erroresMutables))
        }
    }
}

func validarLongitudFuncional() -> (CadenaValidada) -> CadenaValidada {
    return {
        cadena in
        
        if cadena.cadena.characters.count >= 9 {
            return cadena.validar()
        }
        
        return cadena.invalidar(error: "La longitud es menor que 9")
    }
}

func validarArrobaFuncional() -> (CadenaValidada) -> CadenaValidada {
    return {
        cadena in
        
        if let _ = cadena.cadena.range(of: "@") {
            return cadena.validar()
        }
        
        return cadena.invalidar(error: "No se ha encontrado la @")
    }
}

func validarEspaciosFuncional() -> (CadenaValidada) -> CadenaValidada {
    return {
        cadena in
        
        if let _ = cadena.cadena.range(of: " ") {
            return cadena.invalidar(error: "La cadena tiene espacios en blanco")
        }
        
        return cadena.validar()
    }
}

let validarEmailFuncional = {
    cadena in
    validarEspaciosFuncional()(validarLongitudFuncional()(validarArrobaFuncional()(cadena)))
}

validarEmailFuncional(CadenaValidada(cadena: "test@test.com"))
validarEmailFuncional(CadenaValidada(cadena: "fallo en test.com"))

precedencegroup LeftAssociativity {
    associativity: left
}
infix operator >>> : LeftAssociativity
func >>> <A, B, C>(f: @escaping (B) -> C, g: @escaping (A) -> B) -> (A) -> C {
    return { x in f(g(x)) }
}

let validarEmailComposited = validarArrobaFuncional() >>> validarEspaciosFuncional() >>> validarLongitudFuncional()

validarEmailComposited(CadenaValidada(cadena: "test@test.com"))
let invalid = validarEmailComposited(CadenaValidada(cadena: "fallo en test.com"))
switch invalid.validez {
case .noValidado:
    print("No validado")
case .valido:
    print("Cadena válida")
case .invalido(let errores):
    print("Cadena inválida con errores: \(errores)")
}

/*
 *  Este tipo de validaciones son muy flexibles, potentes y extensibles
 *
 *  Ejercicio: Hacer un validador funcional para una pantalla de login.
 *  Inicialmente habrá un campo de login y uno de contraseña
 *  Posibles errores:
 *  - Login en blanco
 *  - Contraseña en blanco
 *  - Longitud de contraseña demasiado corta
 *  - Usuario y contraseña no coinciden
 *
 *  Pensad que en un futuro se puedden añadir reglas:
 *  - Que el login sea una dirección de email
 *  - Un nuevo campo tipo de login (particular / empresa)
 *  - Si es de tipo empresa además hay que poner el CIF
 *  - etc.
 */