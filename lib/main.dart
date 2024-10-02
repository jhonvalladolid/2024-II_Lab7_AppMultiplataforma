import 'package:flutter/material.dart';

void main() {
  runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Productos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PaginaListaProductos(),
    );
  }
}

// Clase que representa un producto
class Producto {
  final String nombre;
  final String imagenPath;
  final double precio;

  Producto({required this.nombre, required this.imagenPath, required this.precio});
}

// Lista de productos en soles (PEN)
List<Producto> listaDeProductos = [
  Producto(nombre: 'Labial Matte Líquido', imagenPath: 'assets/1.jpg', precio: 85.0),
  Producto(nombre: 'Perfume West Lime Evelyn', imagenPath: 'assets/2.jpg', precio: 120.0),
  Producto(nombre: 'Labial Laneige', imagenPath: 'assets/3.jpg', precio: 95.0),
  Producto(nombre: 'Crema Milani Smooth Finish', imagenPath: 'assets/4.webp', precio: 65.0),
];

// Página principal que muestra la lista de productos
class PaginaListaProductos extends StatelessWidget {
  const PaginaListaProductos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Productos'),
      ),
      body: ListView.builder(
        itemCount: listaDeProductos.length, // Número de productos en la lista
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListTile(
              leading: Image.asset(
                listaDeProductos[index].imagenPath, // Imagen del producto
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(listaDeProductos[index].nombre), // Nombre del producto
              subtitle: const Text('Descripción breve del producto aquí.'),
              trailing: Text(
                'S/ ${listaDeProductos[index].precio.toStringAsFixed(2)}', // Precio del producto en soles
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
