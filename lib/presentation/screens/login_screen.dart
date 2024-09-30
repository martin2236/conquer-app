import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../config/config.dart';
import '../../domain/entities/server_entitie.dart';
import '../../domain/infrastructure/conquer_products.dart';
import '../bloc/cubit/data_cubit.dart';
import '../widgets/imputs/custom_dropdown.dart';

final List<Server> servers = [
  Server(id: 1, label: 'Classic_US', name: ServerName.CLASSIC_US),
  Server(id: 2, label: 'Classic_EU', name: ServerName.CLASSIC_EU),
  Server(id: 3, label: 'Classic_MURICA', name: ServerName.CLASSIC_MURICA),
];


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int? serverSelected;
@override
  void initState() {
   _traerProductosDelMaeket();
    super.initState();
  }
  
Future<void> _traerProductosDelMaeket() async {
  final (_,_) = await context.read<DataCubit>().traerProductosDelMaeket();
}
  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final state = context.watch<DataCubit>().state;
  final server = state.server;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/conquerbg.png',height: size.height,fit: BoxFit.cover,),
     state.productosOriginales.isNotEmpty ? 
         Positioned(
          top: size.height * 0.5,
           child: SizedBox(
            height: size.height * 0.5,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   _SelectServer(
                          server: servers,
                          serverSelected: serverSelected,
                          onChanged: (int? value) {
                final selectedServer = servers.where((server) => server.id == value ).first;
                setState(() {
                  serverSelected = value;
                });
                context.read<DataCubit>().saveDropdownValue('server', value);
                 context.read<DataCubit>().saveFilters('server', selectedServer.name);
                          },
                        ),
                        const SizedBox(height: 20,),
                        
                        FilledButton(onPressed:(){
                             if(serverSelected != null){
                              router.go('/home/1');
                             }
                        } , child: const Text('LOGIN')),
                        const SizedBox(height: 20,)
                  
                ],
              ),
            ),
           ),
         )
         :
         Positioned(
          top: size.height * 0.5,
          child: SizedBox(
            height: size.height * 0.5,
            width: size.width,
          child: Center(child: Image.asset('assets/images/loading.gif',height: size.width * 0.7 , width:size.width * 0.7 ,),),
         ))
        ],
      )
    );
  }
}

class _SelectServer extends StatefulWidget {
  final List<Server>? server;
  final int? serverSelected;
  final void Function(int?)? onChanged;
  const _SelectServer({
    required this.server,
    required this.serverSelected,
    required this.onChanged,
  });

  @override
  _SelectRubroState createState() => _SelectRubroState();
}

class _SelectRubroState extends State<_SelectServer> {
  int? selectedOption;
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<int>> dropdownItemsRubro =
        widget.server!.map((server) {
      return DropdownMenuItem<int>(
        value: server.id,
        child: Text(
          server.name.toString().split('.')[1],
          style: const TextStyle(fontSize: 14),
        ),
      );
    }).toList();
    return CustomDropdown( 
      label: 'SERVER',
      hint: widget.serverSelected?.toString() ?? 'Selecciona un servidor',
      value:selectedOption,
      onChanged: widget.onChanged,
      items: dropdownItemsRubro,
    );
  }
}