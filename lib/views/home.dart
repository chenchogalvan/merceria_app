import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:merceria_app/variables.dart';
import 'package:merceria_app/views/product_check.dart';
import 'package:merceria_app/views/search.dart';
import 'package:merceria_app/views/shopping_cart.dart';
import 'package:merceria_app/views/support.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  Position? _position;

  void _getCurrentLocation() async {
    Position position = await _determinePosition();
    distanceInMeters >= 23524 ? inNL = "false" : inNL = "true";
    print(inNL);
    setState(() {
      _position = position;
    });
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permissions are denied');
      }
    }

    Position position = await Geolocator.getCurrentPosition();

    distanceInMeters = Geolocator.distanceBetween(
        position.latitude, position.longitude, 25.6795669, -100.3079035);

    return position;
  }

  final List<Widget> _children = [
    const ProductCheck(),
    // const SearchPage(),
    const ShoppingCart(),
    const SupportPage(),
  ];

  @override
  void initState() {
    _getCurrentLocation();
  }

  void onTapperBar(int index) {
    setState(() {
      _getCurrentLocation();
      _currentIndex = index;
      distanceInMeters >= 23524 ? inNL = "false" : inNL = "true";
      print(inNL);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        key: bottomNavigationKey,
        index: 0,
        items: <Widget>[
          const Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          const Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
          Stack(
            children: [
              const Icon(
                Icons.shopping_cart,
                size: 30,
                color: Colors.white,
              ),
              Positioned(
                // draw a red marble
                bottom: 0.0,
                right: 0.0,
                child: productosDatos.isEmpty
                    ? const Text("")
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.redAccent),
                        alignment: Alignment.center,
                        child: Text(
                          productsLength,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
              )
            ],
          ),
          const Icon(
            Icons.help,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: onTapperBar,
        letIndexChange: (index) => true,
        animationDuration: const Duration(milliseconds: 500),
        animationCurve: Curves.easeOutCubic,
        color: Colors.black,
        backgroundColor: Colors.white,
      ),
    );
  }
}
