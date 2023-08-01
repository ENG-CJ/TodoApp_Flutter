import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Listile extends StatelessWidget {
  const Listile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Coding Map"),
      subtitle: Text("Waxan sameeyn doonaa coding insha allah"),
      trailing: Icon(Icons.read_more),
      leading: Text('🔥'),
    );
  }
}
