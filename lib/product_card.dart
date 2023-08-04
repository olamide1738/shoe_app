import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  const ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.tealAccent, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            children: [
              Text(
                "\$ $price",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              )
            ],
          ),
          Container(
            height: 175,
            width: 200,
            child: Image.asset(imageUrl),
          )
        ],
      ),
    );
  }
}
