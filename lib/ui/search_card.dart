import 'package:flutter/material.dart';

Widget buildSearchCard(String name, String price, String imgPath, bool added,
    bool isFavorite, context) {
  return Padding(
      padding:
          const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Colors.white),
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  isFavorite
                      ? const Icon(Icons.favorite, color: Color(0xFFEF7532))
                      : const Icon(Icons.favorite_border,
                          color: Color(0xFFEF7532))
                ])),
            Hero(
                tag: imgPath,
                child: Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(imgPath),
                            fit: BoxFit.contain)))),
            const SizedBox(height: 7.0),
            Text(price,
                style: const TextStyle(
                    color: Color(0xFFCC8053),
                    fontFamily: 'Varela',
                    fontSize: 14.0)),
            Text(name,
                style: const TextStyle(
                    color: Color(0xFF575E67),
                    fontFamily: 'Varela',
                    fontSize: 14.0)),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(color: const Color(0xFFEBEBEB), height: 1.0)),
            Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (!added) ...[
                        const Icon(Icons.shopping_basket,
                            color: Color(0xFFD17E50), size: 12.0),
                        const Text('Add to cart',
                            style: TextStyle(
                                fontFamily: 'Varela',
                                color: Color(0xFFD17E50),
                                fontSize: 12.0))
                      ],
                      if (added) ...[
                        const Icon(Icons.remove_circle_outline,
                            color: Color(0xFFD17E50), size: 12.0),
                        const Text('3',
                            style: TextStyle(
                                fontFamily: 'Varela',
                                color: Color(0xFFD17E50),
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0)),
                        const Icon(Icons.add_circle_outline,
                            color: Color(0xFFD17E50), size: 12.0),
                      ]
                    ]))
          ])));
}
