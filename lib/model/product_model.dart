class Product {
  final int id;
  final String image, productName, weight, price;

  Product(
      {required this.weight,
      required this.id,
      required this.image,
      // required this.image,
      // required this.images,
      required this.productName,
      required this.price});
}

List<Product> product = [
  Product(
    id: 1,
    price: "Rs100",
    weight: "1kg",
    image: "assets/images/orange.jpeg",
    productName: "Fresh Orange (1kg)",
  ),
  Product(
    id: 2,
    price: "Rs80",
    weight: "1kg",
    image: "assets/images/apple.jpeg",
    productName: "Kashmire Apple",
  ),
  Product(
    id: 3,
    price: "Rs60",
    weight: "1kg",
    image: "assets/images/lady_finger.jpeg",
    productName: "Tazi Bhindi",
  ),
  Product(
    id: 4,
    price: "Rs90",
    weight: "1kg",
    image: "assets/images/brokali.jpeg",
    productName: "Green CauliFlower",
  ),
];
