class Product {
  // final String id;
  // final String name;
  // final String description;
  // final String image;
  // final String price;
  // final String sku;
  final String id;
  final String lista1;
  final String lista2;
  final String lista3;
  final String desc;
  final String numero;
  final String tamano;
  final String colores;
  final String unidad;
  final String empaque;
  final String sku;

  Product({
    // required this.id,
    // required this.name,
    // required this.description,
    // required this.image,
    // required this.price,
    // required this.sku,
    required this.id,
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
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    String color;
    if (json['colores'] == null) {
      color = 'Sin color disponible';
    } else {
      color = json['colores'];
    }
    return Product(
      // id: json['id'].toString(),
      // name: json['name'],
      // description: json['short_description'],
      // image: json["images"][0]["src"],
      // price: json['price'],
      // sku: json['sku'],
      id: json['id'].toString(),
      lista1: json['lista1'].toString(),
      lista2: json['lista2'].toString(),
      lista3: json['lista3'].toString(),
      desc: json['desc'],
      numero: json['numero'],
      tamano: json['tamano'],
      colores: color,
      unidad: json['unidad'],
      empaque: json['empaque'],
      sku: json['sku'],
    );
  }
}
