import 'package:flutter/material.dart';

class NotFoundNavigationWidget extends StatelessWidget {
  const NotFoundNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Not Found',style: TextStyle(color: Colors.teal,fontSize: 40),)),
    );
  }
}
