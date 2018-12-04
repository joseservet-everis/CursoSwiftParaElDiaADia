import Foundation

print([1, 2, 3, 4].filter { $0 % 2 == 0 })


func filtrar(elementos: [Int], funcionParaFiltrar: (Int) -> Bool) -> [Int] {
    var resultado: [Int] = []

    for elemento in elementos {
        if funcionParaFiltrar(elemento) {
            resultado.append(elemento)
        }
    }

    return resultado
}

print(filtrar(elementos: [1, 2, 3, 4], funcionParaFiltrar: { item in
    item % 2 == 0
}))

func esPar(entero: Int) -> Bool {
    return (entero % 2) == 0
}

print(filtrar(elementos: [1, 2, 3, 4], funcionParaFiltrar: esPar))

func filtrarGenerico<T>(elementos: [T], funcionParaFiltrar: (T) -> Bool) -> [T] {
    var resultado: [T] = []

    for elemento in elementos {
        if funcionParaFiltrar(elemento) {
            resultado.append(elemento)
        }
    }

    return resultado
}

print(filtrarGenerico(elementos: ["hola", "adios", "qué tal"], funcionParaFiltrar: { $0.count > 5 }))
print(filtrarGenerico(elementos: [4.5, 6.7, 9.2, 1.5], funcionParaFiltrar: { $0 >= 5.0 }))

extension Array {
    func filtrar(funcionParaFiltrar: (Element) -> Bool) -> [Element] {
        var resultado: [Element] = []

        for elemento in self {
            if funcionParaFiltrar(elemento) {
                resultado.append(elemento)
            }
        }

        return resultado
    }
}

let filtrado = [1, 2, 3, 4].filtrar(funcionParaFiltrar: {$0 % 2 == 0})
print(filtrado)
