import Foundation

struct Color {
    let rojo: Int
    let verde: Int
    let azul: Int

    var string: String {
        return String(format: "0x%02X%02X%02X", rojo, verde, azul)
    }

    static func aleatorio() -> Color {
// En linux no está implementada la función random
//        return Color(rojo: UInt8.random(in: 0...255), verde: UInt8.random(in: 0...255), azul: UInt8.random(in: 0...255))
        return Color(rojo: 42, verde: 42, azul: 42)
    }

    func bits() -> [Int] {
        return (0..<8)
            .reversed()
            .map {
                let mask = 1 << $0
                let r = (rojo & mask) >> $0
                let g = (verde & mask) >> $0
                let b = (azul & mask) >> $0

                return (r << 2) | (g << 1) | b
            }
    }
}

class ImagenAleatoria: Sequence, IteratorProtocol {

    let pixeles: Int
    var contador: Int

    init(ancho: Int, alto: Int) {
        pixeles = ancho * alto
        contador = pixeles
    }

    func next() -> Color? {
        if contador <= 0 {
            return nil
        }

        contador -= 1
        return Color.aleatorio()
    }
}

let imagen = ImagenAleatoria(ancho: 4, alto: 3)
