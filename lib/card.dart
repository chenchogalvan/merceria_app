import 'package:flutter/material.dart';

class CardLayout extends StatefulWidget {
  final String? titulo;
  final String? subtitulo;
  final String? precio;
  const CardLayout({Key? key, this.titulo, this.subtitulo, this.precio})
      : super(key: key);

  @override
  _CardLayoutState createState() => _CardLayoutState();
}

class _CardLayoutState extends State<CardLayout> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            title: Text('${widget.titulo}'),
            subtitle: Text('${widget.subtitulo}'),
            trailing: Text('${widget.precio}')));
  }
}
