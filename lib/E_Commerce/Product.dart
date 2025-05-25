class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final bool isOnSale;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isOnSale = false,
  });
}

List<Product> sampleProducts = [
  Product(
    id: '1',
    title: 'Smartphone',
    description: 'A high-end smartphone with 128GB storage.',
    price: 699.99,
    imageUrl: 'https://via.placeholder.com/150',
    isOnSale: true,
  ),
  Product(
    id: '2',
    title: 'Laptop',
    description: 'Lightweight laptop for professionals.',
    price: 999.99,
    imageUrl: 'https://via.placeholder.com/150',
  ),
];
