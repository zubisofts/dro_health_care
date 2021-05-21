class Product {
  final String pid;
  final String name;
  final String description;
  final String category;
  final String weight;
  final int price;
  final String packSize;
  final String dispensedIn;
  final String constituents;
  final String imageUrl;
  final String manufacturer;
  Product({
    required this.pid,
    required this.name,
    required this.description,
    required this.category,
    required this.weight,
    required this.price,
    required this.packSize,
    required this.dispensedIn,
    required this.constituents,
    required this.imageUrl,
    required this.manufacturer,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.pid == pid &&
        other.name == name &&
        other.description == description &&
        other.category == category &&
        other.weight == weight &&
        other.price == price &&
        other.packSize == packSize &&
        other.dispensedIn == dispensedIn &&
        other.constituents == constituents &&
        other.imageUrl == imageUrl &&
        other.manufacturer == manufacturer;
  }

  @override
  int get hashCode {
    return pid.hashCode ^
        name.hashCode ^
        description.hashCode ^
        category.hashCode ^
        weight.hashCode ^
        price.hashCode ^
        packSize.hashCode ^
        dispensedIn.hashCode ^
        constituents.hashCode ^
        imageUrl.hashCode ^
        manufacturer.hashCode;
  }

  @override
  String toString() {
    return 'Product(pid: $pid, name: $name, description: $description, category: $category, weight: $weight, price: $price, packSize: $packSize, dispensedIn: $dispensedIn, constituents: $constituents, imageUrl: $imageUrl, manufacturer: $manufacturer)';
  }
}
