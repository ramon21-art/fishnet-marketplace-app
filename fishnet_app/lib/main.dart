import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'log-in_screen.dart';
import 'buyer_screens/buyer_home_screen.dart';
import 'seller_screens/seller_home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FishNet Marketplace',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Set your initial route here
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => BuyerHomeScreen(), 
        '/buyerHome': (context) => BuyerHomeScreen(),
        '/sellerHome': (context) => SellerHomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
