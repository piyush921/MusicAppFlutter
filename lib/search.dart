import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});


  @override
  State<StatefulWidget> createState() {
      return _SearchScreen();
  }

}

class _SearchScreen extends State<SearchScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(5),
          children: List.generate(10, (index) {
            return Card(
              elevation: 0.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // 👈 Change radius here
              ),
              margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Person1 $index'),
                subtitle: Text('Subtitle $index'),
              ),
            );
          }),
        )
    );
  }

}