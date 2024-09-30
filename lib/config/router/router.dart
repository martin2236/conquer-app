

import 'package:conquer/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/login_screen.dart';



final router = GoRouter(
  initialLocation: '/',
  routes:[
    GoRoute(
      path: '/',
      builder: (context, state) =>const LoginScreen(),
      ),

        GoRoute(
        path: '/home/:page',
        builder: (context, state) {
           final page = state.pathParameters['page'] ?? '0';
        final pageIndex = int.tryParse(page) ?? 0;
        return HomeScreen(pageIndex: pageIndex);
          }
        ),

      
  ]
  
  );