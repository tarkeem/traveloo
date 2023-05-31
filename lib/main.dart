import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/controller/pflightProvider.dart';
import 'package:travel/view/screens/mainPage.dart';
import 'package:travel/view/screens/mapScreen.dart';
import 'package:travel/view/screens/paymentScreen.dart';
import 'package:travel/view/screens/traveldetailsSc.dart';
import 'package:travel/view/screens/TicketDetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => flight(),
      builder:(context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: mainPage(),
      ),
    );
  }
}
