import 'package:flutter/material.dart';
import '../blocs/navigation_provider.dart';

class Home extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Text("Hello World!"),
      ),
      bottomNavigationBar: B,
    ); 
  }
}