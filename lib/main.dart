import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:merceria_app/productos_data.dart';

import 'dart:async';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _scanBarCode = 'nada';

  
  @override
  void initState() {
    super.initState();
  }


  Future<void> scanBarCodeNormal() async {
    String  barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#000', 'Cancelar', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version';
    }

    if (!mounted) return;

    setState(() {
      _scanBarCode = barcodeScanRes;
    });
      
    }
  



  @override
  Widget build(BuildContext context) {
  var productoData = ProductoData.getData;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Escanea tus precios'),
              actions: <Widget>[
                IconButton(onPressed: (){scanBarCodeNormal();}, icon: const Icon(Icons.scanner)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.help))
              ],
            ),
            body: ListView.builder(
              itemCount: productoData.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                  // leading: FlutterLogo(size: 56.0),
                  title: Text(productoData[index]['producto'].toString()),
                  subtitle: Text(productoData[index]['descripcion'].toString()),
                  trailing: Text(productoData[index]['precio'].toString()),
                ));
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here!

                double sum = productoData.fold(0, (sum, element) =>  sum + double.parse(element['precio'].toString()));
                debugPrint(sum.toStringAsFixed(2));
              },
              backgroundColor: Colors.green,
              child: const Icon(Icons.payment)
            )
          )
      );
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



