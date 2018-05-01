
import UIKit

/*
 *  Ejercicio 01: Cálculo de remuneración de horas extras
 *
 *  En una empresa hay varios trabajadores, y como en la mayoría de empresas, a veces hay que echar
 *  horas extra. Tenemos que calcular el valor de esas horas extras, teniendo en cuenta estas reglas:
 *
 *  - A partir de 40 horas, se consideran horas extra
 *  - Las primeras 8 horas extra se pagan a 1'5 veces la hora normal
 *  - A partir de 8 horas extra, se pagan a 2 veces la hora normal
 *
 *  Ejemplos:
 *
 *  40 horas trabajadas: 0 extra
 *  42 horas trabajadas: 3 * precio hora normal (2 * 1'5)
 *  50 horas trabajadas: 16 * precio hora normal (8 * 1,5 + 2 * 2)
 */

/*
 *  Ejercicio 02: Remuneración de horas extras
 *
 *  Hay varios tipos de empleados en la empresa, y deberíamos ser capaces de contemplar cada uno de ellos:
 *
 *  - Hay empleados que tienen la jornada de 35 horas, el resto es igual
 *  - Hay empleados que cobran todas las horas extras a 1'75 veces la hora normal
 *  - Hay empleados que cobran las 4 primeras horas extra a 1'25 veces la hora normal y el resto a 2 veces la hora normal
 */

/*
 *  Ejercicio 03: Determinar si una cadena es un palíndromo
 *
 *  Como trabajar con cadenas es engorroso, podemos trabajar con arrays de strings.
 *  O podemos usar la siguiente extensión para poder acceder a las posiciones de la cadena
 */

func convertirCadenaEnArray(string: String) -> [String] {
    return string.characters.map { String($0) }
}

extension String {
    subscript(posicion: Int) -> String {
        let index = self.index(self.startIndex, offsetBy: posicion)
        return String(self[index])
    }
}