class ItemModel {
  final String image;
  final String itemTitle;
  final String itemDescription;
  final double itemPrice;

  ItemModel({
    required this.image,
    required this.itemTitle,
    required this.itemDescription,
    required this.itemPrice,
  });
}

List<ItemModel> products = [
  ItemModel(
    image: 'assets/images/clothe1.png',
    itemTitle: 'Flow gown',
    itemDescription: 'Irregualar gown',
    itemPrice: 20.45,
  ),
  ItemModel(
    image: 'assets/images/clothe2.jpg',
    itemTitle: 'Blouse',
    itemDescription: 'Skimpy blouse',
    itemPrice: 20,
  ),
  ItemModel(
    image: 'assets/images/clothe3.jpg',
    itemTitle: 'Bum gown',
    itemDescription: 'Factual attire',
    itemPrice: 30.78,
  ),
  ItemModel(
    image: 'assets/images/clothe4.jpg',
    itemTitle: 'Blobby dress',
    itemDescription: 'Woolen blooby',
    itemPrice: 50,
  ),
  ItemModel(
    image: 'assets/images/clothe5.jpg',
    itemTitle: 'Flow dress',
    itemDescription: 'Part Irregualar gown',
    itemPrice: 25.00,
  ),
  ItemModel(
    image: 'assets/images/clothe6.jpg',
    itemTitle: 'Endless rose',
    itemDescription: 'Rose gown',
    itemPrice: 50.45,
  ),
];
