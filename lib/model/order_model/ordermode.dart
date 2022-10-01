class OrderList {
  final int id;
  final String image;
  final double rating;
  final String product_name;
  final String price;
  final int quantity;
  final String prepackage;

  OrderList(
      {required this.id,
      required this.image,
      required this.product_name,
      required this.rating,
      required this.price,
      required this.quantity,
      required this.prepackage});
}

List<OrderList> orderlist = [
  OrderList(
      id: 1,
      image: "assets/images/product2.jpeg",
      product_name: "Essoy Air Freshner",
      rating: 4.5,
      price: "\$200.00",
      quantity: 500,
      prepackage: "refill"),
  OrderList(
      id: 2,
      image: "assets/images/product2.jpeg",
      product_name: "Essoy Air Freshner",
      rating: 4.5,
      price: "\$200.00",
      quantity: 500,
      prepackage: "Pre-package"),
];
