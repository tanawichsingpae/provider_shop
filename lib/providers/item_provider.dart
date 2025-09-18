import 'package:flutter/material.dart';
import 'package:provider_shop/models/item.dart';

class ItemProvider extends ChangeNotifier {
  final List<Item> _items = [
    Item(id: 'i1', name: 'ดินสอกด 0.5 มม.', description: 'กดง่าย เขียนคม ลบสะดวก', price: 35.0),
    Item(id: 'i2', name: 'แฟ้มสันกว้าง A4', description: 'เก็บเอกสารได้มาก แข็งแรงทนทาน', price: 55.0),
    Item(id: 'i3', name: 'ปากกาไฮไลท์สีเหลือง', description: 'หัวแบน เน้นข้อความชัด', price: 20.0),
  ];

  List<Item> get items => [..._items]; 

  Item findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  void updateItem(String id, Item newItemData) {
    final itemIndex = _items.indexWhere((item) => item.id == id);
    if (itemIndex >= 0) {
      _items[itemIndex] = newItemData;
      notifyListeners(); 
    }
  }
}
