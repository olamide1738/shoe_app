import 'package:flutter/material.dart';
import 'package:shoe_app/cart.dart';
import 'package:shoe_app/global_variables.dart';
import 'package:shoe_app/nav.dart';
import 'package:shoe_app/product_card.dart';
import 'package:shoe_app/product_details.dart';
import 'package:shoe_app/product_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home_filled),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_basket),
              label: '',
            ),
          ],
        ),
  
        body: <Widget>[ProductList(), const CartPage()][currentPageIndex]);
  }
}
