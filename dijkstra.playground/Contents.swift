//: Playground - noun: a place where people can play

import Foundation

class Grafo {

    struct Solucion {
        let camino: [Int]
        let coste: Double

        static var infinito: Solucion {
            return Solucion(camino: [], coste: .greatestFiniteMagnitude)
        }

        static var vacia: Solucion {
            return Solucion(camino: [], coste: 0)
        }
    }

    let numNodos: Int
    let lookup: [Int: [Int: Double]]

    init(numNodos: Int, aristas: [(Int, Int, Double)]) {
        func construirTablaLookup(numNodos: Int, aristas: [(Int, Int, Double)]) -> [Int: [Int: Double]] {
            let tablaVacia: [Int: [Int: Double]] = [:]
            return aristas
                .filter { $0.0 < numNodos }
                .filter { $0.1 < numNodos }
                .reduce(tablaVacia) { tablaActual, arista in
                    var tabla = tablaActual
                    var target = tabla[arista.0] ?? [:]
                    target[arista.1] = arista.2
                    tabla[arista.0] = target

                    return tabla
            }
        }

        self.numNodos = numNodos
        lookup = construirTablaLookup(numNodos: numNodos, aristas: aristas)
    }

    private func coste(desde inicio: Int, hasta fin: Int) -> Double {
        if inicio == fin {
            return 0
        }

        return lookup[inicio]?[fin] ?? .greatestFiniteMagnitude
    }

    func caminoMinimo(entre inicio: Int, y final: Int) -> Solucion {
        // 0. Descartar caso trivial
        if inicio == final {
            return .vacia
        }

        // 1. Marcar todos los nodos como no visitados
        var nodosVisitados: [Bool] = (0..<numNodos).map { _ in false }
        // 2. Inicializar el coste para todos los nodos como el máximo, excepto el inicial cuyo coste es 0
        var soluciones: [Solucion] = (0..<numNodos).map { _ in .infinito }
        soluciones[inicio] = Solucion(camino: [inicio], coste: 0)
        // 3. Empezar por el nodo inicial
        var nodoActual = inicio
        while true {
            // 4. Para el nodo actual, actualizar los costes a los nodos no visitados que puede visitar
            (0..<numNodos)
                .filter { $0 != nodoActual }
                .filter { !nodosVisitados[$0] }
                .forEach {
                    let costeActual = soluciones[$0].coste

                    let coste = self.coste(desde: nodoActual, hasta: $0)
                    let nuevoCoste = soluciones[nodoActual].coste + coste
                    if nuevoCoste < costeActual {
                        soluciones[$0] = Solucion(camino: soluciones[nodoActual].camino + [$0], coste: nuevoCoste)
                    }
                }

            // 5. Marcamos el nodo actual como visitado
            nodosVisitados[nodoActual] = true

            // 6. Buscar el nodo no visitado con el menor coste
            let nodosNoVisitados = zip(nodosVisitados, soluciones)
                .enumerated()
                .filter { !$0.element.0 }
                .sorted { $0.element.1.coste < $1.element.1.coste }
            nodoActual = nodosNoVisitados.first!.offset

            // 7. Si es el nodo final, terminamos
            if nodoActual == final {
                return soluciones[final]
            }
        }
    }

}

let grafo = Grafo(numNodos: 6, aristas: [(0, 1, 7),
                                         (0, 2, 9),
                                         (0, 5, 14),
                                         (1, 0, 7),
                                         (1, 2, 10),
                                         (1, 3, 15),
                                         (2, 0, 9),
                                         (2, 1, 10),
                                         (2, 3, 11),
                                         (2, 5, 2),
                                         (3, 1, 15),
                                         (3, 2, 11),
                                         (3, 4, 6),
                                         (4, 3, 6),
                                         (4, 5, 9),
                                         (5, 0, 14),
                                         (5, 2, 2),
                                         (5, 4, 9)])
let solucion = grafo.caminoMinimo(entre: 0, y: 4)
