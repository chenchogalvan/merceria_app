import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';

bool globalVariableTest = false;
String? inNL;
List<Map<String, dynamic>> productosDatos = [];
String productsLength = "";
GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
double totalProductos = 0.00;

double mtyLatitud = 25.6795669, mtyLongitud = -100.3079035;
double distanceInMeters = 0.0;
var precioCarrito;

const priceProduct = [];
