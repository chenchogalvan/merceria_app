import 'package:flutter/material.dart';

Future<void> buildAlert(BuildContext context, String titulo) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Campo $titulo vacio",
                      style: const TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.black54,
                  thickness: 1,
                )
              ],
            ),
            content: Text(
              "El campo $titulo es obligatorio",
              style:
                  const TextStyle(fontSize: 25.00, fontWeight: FontWeight.w400),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.pop(context, 'Ok'),
                  child: const Text("Ok"))
            ],
          ));
}
