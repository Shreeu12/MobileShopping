import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.asset(cart.items[index].imagePath, width: 50, height: 50),
                      title: Text(cart.items[index].name),
                      subtitle: Text('\$${cart.items[index].price}'),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_circle),
                        onPressed: () {
                          cart.removeItem(cart.items[index]);
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Total: \$${cart.totalPrice}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          );
        },
      ),
    );
  }
}
