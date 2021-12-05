import 'package:flutter/material.dart';
import 'package:merceria_app/productos_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var productoData = ProductoData.getData();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Escanea tus precios'),
            ),
            body: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const Card(
                    child: ListTile(
                  // leading: FlutterLogo(size: 56.0),
                  title: Text('Producto nombre'),
                  subtitle: Text('Descripción'),
                  trailing: Text("\$30.00"),
                ));
              },
            )));
  }
}

class CardProduct extends StatelessWidget {
  const CardProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        // leading: FlutterLogo(size: 56.0),
        title: Text('Producto nombre'),
        subtitle: Text('Descripción'),
        trailing: Text("\$50.00"),
      ),
    );
  }
}
