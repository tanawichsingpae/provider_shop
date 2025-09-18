import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/providers/item_provider.dart';
import 'package:provider_shop/providers/user_profile_provider.dart';
import 'package:provider_shop/screens/edit_item_screen.dart';

class ItemListScreen extends StatelessWidget {
  static const routeName = '/';
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Consumer<UserProfileProvider>(
          builder: (context, UserProfileProvider, child) {
            return Text('รายการสินค้า (ผู้ใช้: ${UserProfileProvider.username})');
          },
        ),
      ),

      body: Consumer<ItemProvider>(
        builder: (context, itemProvider, child) {
          return ListView.builder(
            itemCount: itemProvider.items.length,
            itemBuilder: (context, ind) {
              final item = itemProvider.items[ind];
              return ListTile(
                title: Text('${item.name}'),
                subtitle: Text('${item.description}'),
                trailing: Text('฿${item.price}'),
                onTap: (){
                  Navigator.of(context).pushNamed(
                    EditItemScreen.routeName,
                    arguments: item.id,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
