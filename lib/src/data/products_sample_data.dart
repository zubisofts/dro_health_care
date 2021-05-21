import 'model/product.dart';

class ProductsData {
  static List<Product> productsList = [
    Product(
        pid: "GFJURH4MK",
        name: "Paracetamol (96)",
        description: "Paracetamol",
        category: "Tablet",
        weight: "500mg",
        price: 380,
        imageUrl: "paracetamol.jpg",
        constituents: "Paracetamol Tablets",
        dispensedIn: "Packs",
        packSize: "5x12",
        manufacturer: "Emzor Pharmaceuticals"),
    Product(
        pid: "GFJIRUFBRH",
        name: "Paracetamol Syrup",
        description: "Paracetamol",
        category: "Syrup",
        weight: "125mg",
        price: 165,
        imageUrl: "para_syrup.jpg",
        constituents: "Paracetamol Syrup",
        dispensedIn: "Packs",
        packSize: "4x1",
        manufacturer: "Emzor Pharmaceuticals"),
    Product(
        pid: "JKGyIDGUEJ",
        name: "Garlic Oil",
        description: "Garlic Oil",
        category: "Soft Gel",
        weight: "650mg",
        price: 385,
        imageUrl: "emzor_garlic.jpg",
        constituents: "Garlic Oil",
        dispensedIn: "Packs",
        packSize: "3x10",
        manufacturer: "Emzor Pharmaceuticals"),
    Product(
        pid: "GJFIFHIGJF",
        name: "Panadol Extra",
        description: "Panadol Extra",
        category: "Tablet",
        weight: "450mg",
        price: 400,
        imageUrl: "panadol.png",
        constituents: "Panadol Extra",
        dispensedIn: "Packs",
        packSize: "5x10",
        manufacturer: "Emzor Pharmaceuticals"),
    Product(
        pid: "KGIGDIFNBM",
        name: "Folic Acid",
        description: "Folic Acid",
        category: "Tablet",
        weight: "250mg",
        price: 500,
        imageUrl: "folic_acid.jpg",
        constituents: "Folic Acid",
        dispensedIn: "Packs",
        packSize: "5x1000",
        manufacturer: "Mayer")
  ];

  static List<Product> get products => productsList;

  static List<Product> searchProducts(String query) {
    return productsList
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
