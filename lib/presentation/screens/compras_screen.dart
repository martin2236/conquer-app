// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';

class ComprasScreen extends StatelessWidget {
  const ComprasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body:  Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Text('Compras')
            ],
          ),
        )
    );
  }
}



