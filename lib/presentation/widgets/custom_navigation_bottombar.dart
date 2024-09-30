import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class CustomBottomNavigationBar extends StatelessWidget {

  final int currentIndex;
  const CustomBottomNavigationBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      child: BottomNavigationBar(
        selectedItemColor: Colors.black, 
        unselectedItemColor: Colors.grey, 
        selectedLabelStyle: const TextStyle(color: Colors.white), 
        currentIndex: currentIndex,
        onTap: (value) {
          if (value == 4) {
            context.go('/');
          //  BlocProvider.of<UserBloc>(context).add(LogoutEvent());
          //   Future.delayed(Duration.zero, () {
          //     context.go('/');
          //   });
    
          } else {
            context.go('/home/${value.toString()}');
          }
        },
        items: const [
        
          
           BottomNavigationBarItem(
            icon: Icon(Icons.dinner_dining,),
            label:'Productos'
            ),
    
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart_outlined),
            label:'Crear'
            ),
      
           BottomNavigationBarItem(
            icon: Icon(Icons.shopify),
            label:'Compras'
            ),
    
            BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label:'salir'
            ),
            
        ] ,
        ),
    );
  }
}