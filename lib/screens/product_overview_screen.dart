import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Overview'),
      ),
      body: ProductList(),
    );
  }
}

class ProductList extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {'id': '1', 'title': 'Samsung Galaxy', 'price': 999.99},
    {'id': '2', 'title': 'Oppo Find X', 'price': 799.99},
    {'id': '3', 'title': 'Vivo V21', 'price': 699.99},
    {'id': '4', 'title': 'iPhone 13', 'price': 1099.99},
    {'id': '5', 'title': 'Xiaomi Redmi Note 10', 'price': 499.99},
    {'id': '6', 'title': 'OnePlus 9', 'price': 899.99},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal, // Display items horizontally
      padding: EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(
          id: products[index]['id'],
          title: products[index]['title'],
          price: products[index]['price'],
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final String id;
  final String title;
  final double price;

  const ProductCard({
    required this.id,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Container(
      width: 200, // Fixed width for each product card
      child: Card(
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/product_images/$id.jpg', // Assuming images are named as product IDs in assets
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    '\$$price',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                cart.addItem(id, price, title);
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
