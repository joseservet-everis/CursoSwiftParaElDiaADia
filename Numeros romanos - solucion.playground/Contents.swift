import Foundation

extension Int {
    func romano() -> String {
        var string: [String] = []

        string.append(millares(self))
        let centena = self % 1000
        string.append(centenas(centena))
        let decena = centena % 100
        string.append(decenas(decena))
        let unidad = decena % 10
        string.append(unidades(unidad))

        return string.joined(separator: "")
    }

    func millares(_ x: Int) -> String {
        var string: [String] = []

        let millares = self / 1000
        if millares > 0 {
            string = (1...millares).map { _ in "M" }
        }

        return string.joined(separator: "")
    }

    func centenas(_ x: Int) -> String {
        var string: [String] = []

        var centenas = x / 100
        if centenas == 9 {
            string.append("CM")
        } else if centenas == 4 {
            string.append("CD")
        } else {
            if centenas >= 5 {
                string.append("D")
                centenas -= 5
            }

            if centenas > 0 {
                (1...centenas).forEach { _ in string.append("C") }
            }
        }

        return string.joined(separator: "")
    }

    func decenas(_ x: Int) -> String {
        var string: [String] = []

        var decenas = x / 10
        if decenas == 9 {
            string.append("XC")
        } else if decenas == 4 {
            string.append("XL")
        } else {
            if decenas >= 5 {
                string.append("L")
                decenas -= 5
            }

            if decenas > 0 {
                (1...decenas).forEach { _ in string.append("X") }
            }
        }

        return string.joined(separator: "")
    }

    func unidades(_ x: Int) -> String {
        var string: [String] = []

        var unidad = x
        if unidad == 9 {
            string.append("IX")
        } else if unidad == 4 {
            string.append("IV")
        } else {
            if unidad >= 5 {
                string.append("V")
                unidad -= 5
            }

            if unidad > 0 {
                (1...unidad).forEach { _ in string.append("I") }
            }
        }

        return string.joined(separator: "")
    }
}

let veintisiete = 25.romano()
let cincuentayuno = 51.romano()
let trescientos89 = 389.romano()
