class Currency {
  String code;
  String name;
  dynamic buyPrice;
  dynamic sellPrice;

  Currency({
    this.code = "",
    this.name = "",
    this.buyPrice,
    this.sellPrice,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      code: json['code'] ?? "",
      name: json['name'] ?? "",
      buyPrice: json['buyPrice'],
      sellPrice: json['sellPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'buyPrice': buyPrice,
      'sellPrice': sellPrice,
    };
  }
}
