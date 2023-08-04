import 'package:flutter/material.dart';
import 'package:shoe_app/product_card.dart';
import 'package:shoe_app/product_details.dart';

import 'global_variables.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    "All",
    "Adidas",
    "Nike",
    "Puma",
    "Jordans"
  ];
  late String selectedFilter;

  @override
  void initState() {
    selectedFilter = filters[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          "Shoes \n Collection",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            padding: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(25)),
            width: 200,
            height: 50,
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: ListView.separated(
                  separatorBuilder: (context, int i) {
                    return SizedBox(
                      width: 15,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, int i) {
                    final filter = filters[i];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                          backgroundColor: selectedFilter == filter
                              ? Colors.teal
                              : Colors.white,
                          side: BorderSide(color: Colors.teal),
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          label: Text(
                            filter,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    );
                  }),
            ),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        height: 25,
                      ),
                    );
                  },
                  scrollDirection: Axis.vertical,
                  itemCount: products.length,
                  itemBuilder: (context, int i) {
                    final product = products[i];

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ProductDetails(product: products[i]);
                        }));
                      },
                      child: ProductCard(
                          title: products[i]["title"].toString(),
                          price: products[i]["price"].toString(),
                          imageUrl: products[i]["imageUrl"].toString()),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
