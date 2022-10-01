class CartList {
  final int id;
  final String image;
  final double rating;
  final String product_name;
  final String price;
  final int quantity;

  CartList({
    required this.id,
    required this.image,
    required this.product_name,
    required this.rating,
    required this.price,
    required this.quantity,
  });
}

List<CartList> cartList = [
  CartList(
    id: 1,
    image: "assets/images/coconut_water.jpg",
    product_name: "Coconut Water",
    rating: 4.5,
    price: "\$60",
    quantity: 12,
  ),
  CartList(
    id: 2,
    image: "assets/images/zandu_honey.jpg",
    product_name: "Essoy Air Freshner",
    rating: 4.5,
    price: "\$1995",
    quantity: 500,
  ),
];
