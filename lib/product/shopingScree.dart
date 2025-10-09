import 'package:flutter/material.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping')),
      body: const Center(child: Text('Welcome to the Shopping Screen')),
    );
  }
}
import 'package:flutter/material.dart';

void main() => runApp(WishlistApp());

class WishlistApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wishlist',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: WishlistPage(),
    );
  }
}

class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  List<Map<String, String>> wishlistItems = [
    {
      'title': 'Wireless Headphones',
      'image': 'https://via.placeholder.com/150'
    },
    {'title': 'Smart Watch', 'image': 'https://via.placeholder.com/150'},
    {'title': 'Gaming Laptop', 'image': 'https://via.placeholder.com/150'},
  ];

  void removeItem(int index) {
    setState(() {
      wishlistItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Wishlist')),
      body: wishlistItems.isEmpty
          ? Center(child: Text('Your wishlist is empty!'))
          : ListView.builder(
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                final item = wishlistItems[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.network(item['image']!),
                    title: Text(item['title']!),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => removeItem(index),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
