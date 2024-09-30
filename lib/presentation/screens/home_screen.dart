
import 'package:flutter/material.dart';

import '../widgets/widget.dart';
import 'compras_screen.dart';
import 'crear_screen.dart';
import 'market_screen.dart';


class HomeScreen extends StatelessWidget {
  final int pageIndex;
   const HomeScreen({super.key, required this.pageIndex});

   final viewRoutes = const<Widget> [
    MarketScreen(),
    CrearScreen(),
    ComprasScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final validPageIndex = (pageIndex >= 0 && pageIndex < viewRoutes.length) ? pageIndex : 0;
   return Scaffold(
      body: Stack(
        children: [
          // Pantalla principal que cambia según el índice seleccionado
          Positioned.fill(
            child: IndexedStack(
              index: validPageIndex,
              children: viewRoutes,
            ),
          ),
          // Barra de navegación posicionada en la parte inferior
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBottomNavigationBar(currentIndex: pageIndex),
          ),
        ],
      ),
    );
  }
}