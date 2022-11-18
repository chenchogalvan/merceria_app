import 'package:flutter/material.dart';
import 'package:merceria_app/variables.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CardStore extends StatefulWidget {
  String id,
      lista1,
      lista2,
      lista3,
      desc,
      numero,
      tamano,
      colores,
      unidad,
      empaque,
      sku,
      opcion;
  CardStore(
      {required this.id,
      required this.lista1,
      required this.lista2,
      required this.lista3,
      required this.desc,
      required this.numero,
      required this.tamano,
      required this.colores,
      required this.unidad,
      required this.empaque,
      required this.sku,
      required this.opcion});

  String? texto;
  @override
  State<CardStore> createState() => _CardStoreState();
}

class _CardStoreState extends State<CardStore> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(15),
      elevation: 25,
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: inNL == "true"
                ? Text(
                    "SKU: ${widget.sku} \nPrecio: ${widget.lista2} \nPrecio Mayoreo: ${widget.lista1} ")
                : Text("SKU: ${widget.sku} \nPrecio: ${widget.lista3}"),
            subtitle:
                Text('Producto: \n${widget.desc} \nColor: \n${widget.colores}'),
            leading: const Icon(
              Icons.store,
              size: 50.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              widget.opcion == "0"
                  ? ButtonBar(
                      children: [
                        TextButton(
                          child: const Text(
                            "Agregar al carrito",
                            style: TextStyle(color: Colors.black87),
                          ),
                          onPressed: () {
                            //Aquí asignamos a la variable global para el carrito
                            Map<String, dynamic> productoDato = {
                              'id': widget.id,
                              'lista1': widget.lista1,
                              'lista2': widget.lista2,
                              'lista3': widget.lista3,
                              'desc': widget.desc,
                              'numero': widget.numero,
                              'tamano': widget.tamano,
                              'colores': widget.colores,
                              'unidad': widget.unidad,
                              'empaque': widget.empaque,
                              'sku': widget.sku,
                              'opcion': widget.opcion,
                            };

                            setState(() {
                              productosDatos.add(productoDato);
                              productsLength = productosDatos.length.toString();

                              //sumamos
                              inNL == "true"
                                  ? precioCarrito = double.parse(widget.lista2)
                                  : precioCarrito = double.parse(widget.lista3);
                              // debugPrint(totalProductos.toString());
                              totalProductos += precioCarrito;
                            });

                            //Sumamos y guardamos en variable global
                            // var precioProducto = productoDato;
                            // totalProductos = precioProducto.fold(
                            //     0, (sum, element) => sum + element);
                            // debugPrint(totalProductos.toString());
                            //mostramos el snackbar
                            final snackBar = SnackBar(
                              content:
                                  Text('El producto se agrego correctamente.'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                        ),
                      ],
                    )
                  : ButtonBar(
                      children: <Widget>[
                        TextButton(
                          child: const Text("Eliminar del carrito"),
                          onPressed: () {
                            //Aquí asignamos a la variable global para el carrito

                            setState(() {
                              productosDatos.removeWhere(
                                  (item) => item["id"] == widget.id);

                              productsLength = productosDatos.length.toString();
                              // Navigator.of(context).pop(true);

                              //restamos
                              totalProductos -= double.parse(widget.lista2);
                              // debugPrint(totalProductos.toString());

                              final CurvedNavigationBarState? navBarState =
                                  bottomNavigationKey.currentState;
                              navBarState?.setPage(0);
                            });

                            final snackBar = SnackBar(
                              content: Text(
                                  'El producto se elimino correctamente correctamente.'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                        ),
                      ],
                    )
            ],
          )
        ],
      ),
    );
  }
}
