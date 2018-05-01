
import UIKit

/*
 *  Tipos:
 *
 *  - Swift es un lenguaje fuertemente tipado
 *  - Necesita saber en todo momento con qué tipo está trabajando
 */

let hola: String = "hola"   // Constante, tipo explícito
let adios = "adiós"         // Constante, tipo inferido
var verdadero = true        // Variable

/*
 *  Tipos: semántica de valor, semántica de referencia
 *  --------------------------------------------------
 */
  
/*
 *  Semántica de valor:
 *  - Los datos se copian
 *  - Es más seguro, sobre todo en entornos multithread
 *  - Hacen más sencilla la inmutabilidad
 *  - structs, enums, escalares simples, arrays
 *  - No hay herencia
 */

let constante = 5           // constante = 5
var variable = constante    // constante = 5, variable = 5
variable += 1               // constante = 5, variable = 6

// structs
struct Coordenada2D {
    let x: Int
    let y: Int
}

let origen = Coordenada2D(x: 0, y: 0)

func mover(coordenada: Coordenada2D, desplazamientoHorizontal: Int, desplazamientoVertical: Int) -> Coordenada2D {
    let nuevaCoordenada = Coordenada2D(x: coordenada.x + desplazamientoHorizontal, y: coordenada.y + desplazamientoVertical)
    return nuevaCoordenada
}

let destino = mover(coordenada: origen, desplazamientoHorizontal: 1, desplazamientoVertical: 2)

// enums
enum Bebida {
    case agua
    case refresco
    case cerveza
    case vino
}

enum Resultado {    // los casos del enum pueden tener valores asociados
    case ok
    case error(mensaje: String)
}

let fallo = Resultado.error(mensaje: "Error inesperado")
let bien = Resultado.ok

func evaluar(_ resultado: Resultado) -> String {
    switch resultado {
    case .ok:
        return "Todo ha ido bien"
    case .error(mensaje: let error):
        return "Ha ocurrido algún error: \(error)"
    }
}

evaluar(fallo)
evaluar(bien)

/*
 *  Semántica de referencia:
 *  - Se copia la referencia a la instancia
 *  - Permiten herencia
 *  - Potencialmente inseguro
 */

class Animal {
    var alimento: String
    
    init(alimento: String) {
        self.alimento = alimento
    }
}

class 🐱: Animal {
    init() {
        super.init(alimento: "🐭")
    }
}

class 🐭: Animal {
    init() {
        super.init(alimento: "🧀")
    }
}

let jerry = 🐭()
let tom = 🐱()
tom.alimento = "🥗" // Lo que es constante es la referencia, pero podemos cambiar el contenido porque es var

// Cuidado, se asigna una referencia
let tuffy = jerry
tuffy.alimento = "🍼"
tuffy.alimento
jerry.alimento

/*
 *  Multiparadigma
 *  --------------
 */

/*
 *  POO (Programación Orientada a Objetos)
 *
 *  - Paradigma clásico de programación
 *  - Podemos utilizar tanto clases como structs
 *  - Los enums son muy potentes, nos permiten modelar mejor algunos dominios
 */

// Podemos ver los ejemplos anteriores: resultados, animales, etc.

/*
 *  PF (Programación Funcional)
 *
 *  - Tratamos a las funciones como tipos
 *  - filter, map, flatMap, reduce
 *  - Closures, trailing closure syntax
 *  - En las closures se pueden poner listas de captura
 *  - Hay que llevar cuidado cuando se referencia self en una closure para no crear ciclos
 */

func sumar(_ a: Int, _ b: Int) -> Int {
    return a + b
}

//let sumarClosure = { a, b in
//    return a + b
//}
// Es ambigua porque no sabemos el tipo de a, b, ni de lo que debe devolver

let sumarClosure: (Int, Int) -> Int = { a, b in
    return a + b
}

func cuadrado(x: Int) -> Int {
    return x * x
}

let numeros = [1, 2, 3, 4]
let cuadrados = numeros.map(cuadrado)
let cuadradosAlternativos = numeros.map { $0 * $0 }

class NetworkManager {
    let handler: (Resultado) -> Void
    
    init(handler: @escaping (Resultado) -> Void) {
        self.handler = handler
    }
    
    func request() {
        // hacer peticion ...
        handler(Resultado.ok)
    }
    
    func finish() {
        // hacer limpieza
    }
}

let networkManager = NetworkManager() {
    // habría que llevar cuidado si usamos networkManager dentro de esta closure
    print($0)
}

/*
 *  Opcionales
 *
 *  - Son parte del lenguaje, se indica explícitamente si algo puede ser nulo o no
 *  - Hay que "unwrapearlos" antes de usarlos para asegurar que tienen valor
 *  - Se pueden encadenar opcionales, llamadas a métodos opcionales, etc.
 *  - Se puede usar el operador de nil coalescing ??
 *  - Podemos forzar el unwrapeado si sabemos que algo no va a ser nulo
 */

let movil: String? = "630 123 123"
let fijo: String? = nil

func imprimeTelefono(_ telefono: String?) {
    if let telefono = telefono {
        print("Teléfono: \(telefono)")
    } else {
        print("No hay teléfono")
    }
}

imprimeTelefono(movil)
imprimeTelefono(fijo)

/*
 *  Genéricos:
 *  - Todos los tipos pueden ser genéricos, tanto los de semántica de valor como los de referencia
 *  - Permite escribir el código solo una vez, sin tener que hacerlo para cada tipo
 *  - Se puede aplicar también a funciones
 *  - Se puede restringir los elementos sobre los que se aplica
 *  - Los arrays, diccionarios, etc. en Swift son genéricos
 */

enum ResultadoGenerico<R, E> {
    case ok(resultado: R)
    case error(error: E)
}

func obtenerMovil(usuario: String) -> ResultadoGenerico<String, Int> {
    // Aqui se harían peticiones para obtener los datos del usuario
    if let movil = movil {
        return .ok(resultado: movil)
    } else {
        return .error(error: -10)
    }
}

let resultadoMovil = obtenerMovil(usuario: "test")

/*
 *  Protocolos:
 *  - Permiten abstraer detalles de la implementación
 *  - Es más fácil reutilizar y ampliar código
 *  - En Swift, además de POO y PF se puede utilizar también POP (Programación Orientada a Protocolos)
 */

protocol Movil {
    var coordenada: Coordenada2D { get }
    
    mutating func mover(a posicion: Coordenada2D)
}

protocol Atacante {
    func disparar(hacia punto: Coordenada2D)
}

struct Personaje: Movil, Atacante {
    var coordenada: Coordenada2D
    
    mutating func mover(a posicion: Coordenada2D) {
        coordenada = posicion
    }
    
    func disparar(hacia punto: Coordenada2D) {
        // notificar al motor de juego que queremos disparar, etc.
    }
}

struct Torreta: Atacante {
    func disparar(hacia punto: Coordenada2D) {
        // notificar al motor de juego que queremos disparar, etc.
    }
}

let personaje = Personaje(coordenada: Coordenada2D(x: 0, y: 0))
let torreta = Torreta()
torreta.disparar(hacia: personaje.coordenada)

/*
 *  Extensiones:
 *  - Permiten añadir código a cualquier tipo, independientemente de que tengamos el código
 *  - Son muy útiles para adoptar protocolos
 */

protocol Sumable {
    static func + (a: Self, b: Self) -> Self
}

protocol Divisible {
    static func / (a: Self, b: Self) -> Self
}

protocol IntInitializable {
    init(_ entero: Int)
}

extension Int: Sumable {}
extension Int: Divisible {}
extension Int: IntInitializable {}
extension Double: Sumable {}
extension Double: Divisible {}
extension Double: IntInitializable {}

func calcularMedia<T: Sumable & Divisible & IntInitializable>(numeros: [T]) -> T {
    guard !numeros.isEmpty else {
        return T(0)
    }
    
    return numeros.reduce(T(0), +) / T(numeros.count)
}

let mediaEntera = calcularMedia(numeros: [1, 2, 3, 4, 5, 6])
let mediaReal = calcularMedia(numeros: [1.0, 2.0, 3.0, 4.0, 5.0, 6.0])

print(mediaEntera)
print(mediaReal)
