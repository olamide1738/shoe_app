import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/global_variables.dart';
import 'package:shoe_app/homepage.dart';

import 'cart-provider.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, Object> product;

  ProductDetails({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedsize = 0;
  void onTap() {
    if (selectedsize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct({
        "id": widget.product["id"],
        "title": widget.product["title"],
        "price": widget.product["price"],
        "sizes": selectedsize,
        "imageUrl": widget.product["imageUrl"],
        "company": widget.product["company"]
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Added to Cart")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please select a size")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Details",
            style: TextStyle(),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop(Homepage());
              },
              icon: Icon(Icons.arrow_back))),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.product["title"] as String,
                  style: TextStyle(fontSize: 35),
                )
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(widget.product['imageUrl'] as String),
            ),
            Spacer(),
            Row(
              children: [
                Text(
                  "\$ ${widget.product["price"]}",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Spacer(),
            SizedBox(
                height: 50,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product["sizes"] as List).length,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                    itemBuilder: (context, int i) {
                      final size = (widget.product["sizes"] as List)[i];

                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedsize = size;
                            });
                          },
                          child: Chip(
                            label: Text(size.toString()),
                            backgroundColor:
                                selectedsize == size ? Colors.tealAccent : null,
                          ));
                    })),
            Spacer(),
            TextButton.icon(
                style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(300, 80)),
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
                onPressed: onTap,
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                label: Text(
                  "Add to Cart",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
