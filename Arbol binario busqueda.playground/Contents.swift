import Foundation

class Arbol {
    class Nodo {
        let valor: Int
        var izquierda: Nodo? = nil
        var derecha: Nodo? = nil

        init(valor: Int) {
            self.valor = valor
        }

        func insertar(valor: Int) {
            if self.valor == valor {
                return
            }

            if valor < self.valor {
                // buscar por la izquierda
                if let izquierda = self.izquierda {
                    izquierda.insertar(valor: valor)
                } else {
                    izquierda = Nodo(valor: valor)
                }
            } else {
                // buscar por la derecha
                if let derecha = self.derecha {
                    derecha.insertar(valor: valor)
                } else {
                    derecha = Nodo(valor: valor)
                }
            }
        }

        func buscar(valor: Int) -> Bool {
            if valor == self.valor {
                return true
            }

            if valor < self.valor {
                if let izquierda = izquierda {
                    return izquierda.buscar(valor: valor)
                } else {
                    return false
                }
            } else {
                if let derecha = derecha {
                    return derecha.buscar(valor: valor)
                } else {
                    return false
                }
            }
        }

        func ordenadoAscendente() -> [Int] {
            let left = izquierda?.ordenadoAscendente() ?? []
            let right = derecha?.ordenadoAscendente() ?? []
            let elementos = [left, [valor], right]
            return elementos.flatMap { $0 }
        }
    }

    var raiz: Nodo?

    func insertar(valor: Int) {
        if let raiz = raiz {
            raiz.insertar(valor: valor)
        } else {
            raiz = Nodo(valor: valor)
        }
    }

    func buscar(valor: Int) -> Bool {
        if let raiz = raiz {
            return raiz.buscar(valor: valor)
        } else {
            return false
        }
    }

    func ordenadoAscendente() -> [Int] {
        return raiz?.ordenadoAscendente() ?? []
    }

    func ordenadoDescendente() -> [Int] {
        let ascendente = raiz?.ordenadoAscendente() ?? []
        return ascendente.reversed()
    }


}

let arbol = Arbol()
arbol.insertar(valor: 6)
arbol.insertar(valor: 5)
arbol.insertar(valor: 10)
arbol.insertar(valor: 15)

let existeEl10 = arbol.buscar(valor: 10)
let existeEl20 = arbol.buscar(valor: 20)

func juntarArrays(array1: [Int], array2: [Int]) -> [Int] {
    return array1 + array2
}

func añadirEntero(array1: [Int], entero: Int) -> [Int] {
    return juntarArrays(array1: array1, array2: [entero])
//    return array1 + [entero]
}

let arrayDeArrays = [ [1, 2, 3], [4], [5, 6]]
let aplanado = arrayDeArrays.flatMap { $0 }
aplanado

print(arbol.ordenadoAscendente())
print(arbol.ordenadoDescendente())
