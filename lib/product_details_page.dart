import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product.dart';
import 'cart.dart';
import 'cart_page.dart';

class ProductDetailsPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Samsung Galaxy',
      description: 'An excellent smartphone from Samsung with advanced features.',
      price: 799.99,
      imagePath: 'assets/samsung.jpg',
    ),
    Product(
      name: 'Oppo Find X',
      description: 'Innovative design and powerful performance.',
      price: 699.99,
      imagePath: 'assets/oppo.jpg',
    ),
    Product(
      name: 'Vivo V21',
      description: 'Sleek design and impressive camera capabilities.',
      price: 499.99,
      imagePath: 'assets/vivo.jpg',
    ),
    Product(
      name: 'iPhone 13',
      description: 'The latest iPhone with cutting-edge technology.',
      price: 999.99,
      imagePath: 'assets/apple.jpg',
    ),
    Product(
      name: 'Xiaomi Redmi Note 10',
      description: 'Great value for money with a large display and long battery life.',
      price: 299.99,
      imagePath: 'assets/redmi.jpg',
    ),
    Product(
      name: 'Xiaomi Redmi Note 10',
      description: 'Great value for money with a large display and long battery life.',
      price: 299.99,
      imagePath: 'assets/redmi.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ListView.builder(
            itemCount: (products.length / 3).ceil(),
            itemBuilder: (context, index) {
              final start = index * 3;
              final end = (index + 1) * 3;
              final productsChunk = products.sublist(start, end < products.length ? end : products.length);
              return Row(
                children: productsChunk.map((product) {
                  return Flexible(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ProductCard(product: product),
                    ),
                  );
                }).toList(),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.asset(
                product.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                product.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                product.description,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '\$${product.price}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                Provider.of<Cart>(context, listen: false).addItem(product);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text('Add to Cart'),
              ),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
