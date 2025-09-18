import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/providers/item_provider.dart';
import 'package:provider_shop/providers/user_profile_provider.dart';
import 'package:provider_shop/screens/edit_item_screen.dart';
import 'package:provider_shop/screens/item_list_screen.dart';

void main() {
  runApp(MultiProvider(providers:[
    ChangeNotifierProvider(create: (context) => ItemProvider()),
    ChangeNotifierProvider(create: (context) => UserProfileProvider()),
  ], 
   child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: ItemListScreen.routeName,
      routes: {
        ItemListScreen.routeName: (context) => const ItemListScreen(),
        EditItemScreen.routeName: (context) => const EditItemScreen(),
      },
    );
  }
}
