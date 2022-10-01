class SearchItem {
  final int id;
  final String image;
  final String product_name;
  final String refilable;

  SearchItem({
    required this.id,
    required this.image,
    required this.product_name,
    required this.refilable,
  });
}

List<SearchItem> searchItem = [
  SearchItem(
    id: 1,
    image: "assets/images/dis.jpg",
    product_name: "Rossari Dishwasher Detergent",
   refilable: "Refilabe",
  ),
  SearchItem(
    id: 2,
    image: "assets/images/dis.jpg",
    product_name: "Rossari Laundry Detergent",
    refilable: "with container",
 
  ),
   SearchItem(
    id: 3,
    image: "assets/images/dis.jpg",
    product_name: "Harbal Strategi Laundary Detergent",
    refilable: "Refilabe",
 
  ),
   SearchItem(
    id: 4,
    image: "assets/images/dis.jpg",
    product_name: "Harbal Strategi Dishwashing Detergent",
    refilable: "Refilabe",
 
  ),
   SearchItem(
    id: 5,
    image: "assets/images/dis.jpg",
    product_name: "The Better Home Detergent",
    refilable: "with container",
 
  ),
   SearchItem(
    id: 6,
    image: "assets/images/dis.jpg",
    product_name: "The Better Home Laundry Detergent",
    refilable:  "with container",
 
  ),


];
