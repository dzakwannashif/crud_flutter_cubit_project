class Anggota {
  final int? id;
  final String name;
  final int price;

// ! NAMED
  Anggota({
    this.id,
    required this.name,
    required this.price,
  });

  factory Anggota.fromJson(Map<String, dynamic> json) => Anggota(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        price: json['price'] ?? '',
      );
  // ! NAMED

  // ! Positional
  // Anggota(
  //   this.id,
  //   this.name,
  //   this.price,
  // );

  // factory Anggota.fromJson(Map<String, dynamic> json) => Anggota(
  //       json['id'] ?? '',
  //       json['name'] ?? '',
  //       json['price'] ?? '',
  //     );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        'name': name,
        'price': price.toString(),
      };
}
