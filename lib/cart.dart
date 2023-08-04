import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/cart-provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context).cart;

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, i) {
          final cartItem = cart[i];
          return Dismissible(
              key: Key(UniqueKey().toString()),
              onDismissed: (DismissDirection direction) {
                Provider.of<CartProvider>(context, listen: false)
                    .removeProduct(cartItem);
              },
              // Show a red background as the item is swiped away.
              background: Container(color: Colors.red),
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.tealAccent,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset(
                    cartItem["imageUrl"].toString(),
                    width: 70,
                    height: 70,
                  ),
                ),
                title: Text(
                  cartItem["title"].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Size: ${cartItem["sizes"].toString()}"),
                trailing: Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15)),
                  child: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  "Delete Product",
                                  style: TextStyle(fontSize: 20),
                                ),
                                content: Text(
                                    "Are you sure you want to remove item from cart?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(CartPage());
                                      },
                                      child: Text(
                                        "NO",
                                        style: TextStyle(color: Colors.teal),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Provider.of<CartProvider>(context,
                                                listen: false)
                                            .removeProduct(cartItem);
                                        Navigator.of(context).pop(CartPage());
                                      },
                                      child: Text(
                                        "Yes",
                                        style: TextStyle(color: Colors.red),
                                      ))
                                ],
                              );
                            });
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                      )),
                ),
              ));
        },
      ),
    );
  }
}
