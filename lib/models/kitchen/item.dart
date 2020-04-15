import 'package:cloud_firestore/cloud_firestore.dart';

class Item{

  final String itemId;
  final bool available;
  final String name;
  final String description;
  final int persons;
  final int price;
  final String image;
  final String category;

  Item({this.itemId, this.available, this.name, this.description, this.persons, this.price, this.image, this.category });


  factory Item.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    
    return Item(
      available: data['available'] ?? '',
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      persons: data['persons'] ?? '',
      price: data['price'] ?? ''
    );
  }

}

