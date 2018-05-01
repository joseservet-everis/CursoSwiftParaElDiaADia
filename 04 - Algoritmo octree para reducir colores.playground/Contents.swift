
import UIKit

/*
 *  Algoritmo octree para reducir colores
 *
 *  Realmente, un octree es una estructura de árbol. Es similar a un árbol binario, pero en vez de
 *  cada nodo tener 2 hijos, tiene 8. Normalmente se usa para particionar espacios tridimensionales.
 *
 *  En nuestro caso, queremos implementar un algoritmo para poder reducir colores, de una imagen
 *  de color real (24 bits RGB, 8 bits R, 8 bits G, 8 bits B) nos gustaría pasar a 16, 32, 256 o el
 *  número de colores que queramos.
 *
 *  El funcionamiento del algoritmo es sencillo:
 *
 *  Creamos un nodo raíz vacío
 *  Primero recorremos los píxeles de la imagen original:
 *  En cada píxel, recorremos los 8 bits de cada componente, empezando por el más significativo, y generamos el índice correspondiente con los componentes RGB.
 *
 *  Ejemplo:
 *
 *  R: 0b00101100 - 44
 *  G: 0b10001000 - 136
 *  B: 0b01010101 - 85
 *
 *  Primer nivel: 010 - 2
 *  Segundo nivel: 001 - 1
 *  ...
 *  Octavo nivel: 001 - 1
 *
 *  Inicialmente, en el octavo nivel, tendremos todos los nodos hoja.
 *  Cuando vayamos creando nuestra estructura de árbol, en los nodos hoja guardamos el número de referencias a cada color.
 *
 *  Cuando hemos pasado por todos los píxeles, iniciamos la fase de reducción, si fuera necesario. Hay que ir buscando los nodos que tengan menos referencias, y reducimos ese nodo, vamos "subiendo" cada nodo, perdiendo los bits menos significativos, y fusionando las referencias en caso de que vayamos reduciendo nodos hoja.
 */
