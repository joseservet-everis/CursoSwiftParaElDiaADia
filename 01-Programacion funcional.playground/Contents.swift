/*
 *  01 - Programacion funcional
 *
 *  Swift para el día a día
 *  Everis Centros
 *
 *  © José Servet Font, 2018
 */

import UIKit

/*
 *  En Swift, es muy fácil utilizar construcciones del lenguaje para encadenar funciones.
 *  De esta forma el código resultante es más sencillo de entender por otras personas
 */

/*
 *  Imaginemos que nos han encargado un sistema de gestión de un hospital.
 *  Tenemos suerte y el hospital aún está en construcción, por lo que podemos diseñar el sistema a medida que lo necesitemos.
 *  Conforme van construyendo, van haciendo distintos tipos de salas: habitaciones, quirófanos, salas de espera, consultas, cafeterías, puntos de información, aseos ...
 */

/*
 *  Opción 1: Subclases
 */

class ClaseSala {
    let planta: Int
    let identificador: String
    
    init(planta: Int, identificador: String) {
        self.planta = planta
        self.identificador = identificador
    }
}

class ClaseHabitacion: ClaseSala {
    let capacidad: Int
    
    init(planta: Int, identificador: String, capacidad: Int) {
        self.capacidad = capacidad
        super.init(planta: planta, identificador: identificador)
    }
}

class ClaseQuirofano: ClaseSala {
}

// ...

/*
 *  Problemas: 
 *  - Son clases (semántica de referencia)
 *  - La clase Quirofano es igual que la de Sala, solo se diferencia por la interpretación
 */

/*
 *  Opción 2: enums
 */

enum EnumTipoSala {
    case habitacion(capacidad: Int)
    case quirofano
    case salaDeEspera(capacidad: Int)
    case cafeteria(desde: Date, hasta: Date)
}

struct EnumSala {
    let planta: Int
    let identificador: String
    let tipo: EnumTipoSala
}

/*
 *  Mejoras:
 *  - Podemos usar enums
 *
 *  Problemas:
 *  - Extensibilidad. Es muy difícil meter nuevos tipos, si por ejemplo después se ponen salas de rayos
 */

/*
 *  Opción 3: genéricos y protocolos
 */

protocol ProtocoloTipoSala {}

protocol ProtocoloSala {
    var planta: Int { get }
    var identificador: String { get }
}

struct Capacidad: ProtocoloTipoSala {
    let capacidad: Int
}

struct Horario: ProtocoloTipoSala {
    let desde: Int  // Esto deberian ser horas
    let hasta: Int
}

struct Habitacion: ProtocoloSala {
    let planta: Int
    let identificador: String
    let capacidad: Capacidad
    
    init(planta: Int, identificador: String, capacidad: Int) {
        self.planta = planta
        self.identificador = identificador
        self.capacidad = Capacidad(capacidad: capacidad)
    }
}

class Cafeteria: ProtocoloSala {
    let planta: Int
    let identificador: String
    let horario: Horario
    
    init(identificador: String, desde: Int, hasta: Int) {
        self.planta = 0
        self.identificador = identificador
        self.horario = Horario(desde: desde, hasta: hasta)
    }
}

let habitacion305 = Habitacion(planta: 3, identificador: "305", capacidad:2)
let comedor = Cafeteria(identificador: "Comedor", desde: 12, hasta: 17)

/*
 *  Mejoras:
 *  - No dependemos de las clases, podemos usar structs
 *  - Es completamente ampliable, podemos definir nuevas clases que adopten los protocolos
 *  - Podemos hacer composición de capacidades y reutilizar las que ya existen
 */

struct SalonDeActos: ProtocoloSala {
    let planta: Int
    let identificador: String
    let capacidad: Capacidad
    let horario: Horario
    
    init(planta: Int, identificador: String, capacidad: Int, desde: Int, hasta: Int) {
        self.planta = planta
        self.identificador = identificador
        self.capacidad = Capacidad(capacidad: capacidad)
        self.horario = Horario(desde: desde, hasta: hasta)
    }
}

let salonDeActos = SalonDeActos(planta: 0, identificador: "Salon de actos principal", capacidad: 200, desde: 9, hasta: 12)

print(salonDeActos)

class Hospital {
    let salas: [ProtocoloSala]
    
    init(salas: [ProtocoloSala]) {
        self.salas = salas
    }
}

let hospital = Hospital(salas: [habitacion305, comedor, salonDeActos])
let habitaciones = hospital.salas.filter { $0 is Habitacion }
let cafeterias = hospital.salas.filter { $0 is Cafeteria }

print(habitaciones)
print(cafeterias)

/*
 *  Ejercicio: ¿cómo podemos saber cuantos pacientes pueden estar en el hotel?
 */

// Deberíamos usar programación funcional: filter, map, flatMap, reduce, etc.
let pacientes = habitaciones.flatMap { $0 as? Habitacion }.map { $0.capacidad.capacidad }.reduce(0, +)
pacientes

/*
 *  Ejercicio: ¿cómo modelar los profesionales que trabajan en el hospital?
 *
 *  Tendremos: médicos, enfermeras, cirujanos, anestesistas, radiólogos ... pensar que más adelante pueden aparecer nuevas técnicas que requieran nuevas profesiones, o distintas habilidades
 *  Por ejemplo, los médicos tienen un horario de consultas, las enfermeras trabajan en una sola planta, los cirujanos tienen una especialidad ...
 *  Después querremos hacer búsquedas de las enfermeras que están a una determinada hora, o los cirujanos que tienen una determinada especialidad
 */