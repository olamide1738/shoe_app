import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/cart-provider.dart';
import 'package:shoe_app/homepage.dart';
import 'package:shoe_app/product_details.dart';

import 'global_variables.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return CartProvider();
      },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shopping App',
          theme: ThemeData(
              fontFamily: "Roboto",
              colorScheme:
                  ColorScheme.fromSeed(seedColor: Colors.teal.shade200),
              useMaterial3: true),
          home: MyHomePage(
            title: 'Flutter Demo Home Page',
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Homepage();
  }
}
