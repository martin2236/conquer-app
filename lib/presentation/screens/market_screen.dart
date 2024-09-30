import 'dart:async';
import 'dart:io';

import 'package:conquer/config/helpers/format_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/conquer_products_entitie.dart';
import '../../domain/infrastructure/conquer_products.dart';
import '../bloc/cubit/data_cubit.dart';
import '../widgets/custom_drawer.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      drawer:const  CustomDrawer(),
      appBar: AppBar(
        title: const Text('Market'),
      ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child:BlocBuilder<DataCubit,DataCubitState>(
                  builder: (context, state) {
                    final productos = state.productosFiltrados;
                    return ListView.builder(
                  itemCount: productos.length,
                  itemBuilder: (context, index) {
                    return _ConquerProductRow(product : productos[index]);
                  },
                );
                  },
                ),
              )
            ],
          ),
        )
    );
  }
}

class _ConquerProductRow extends StatefulWidget {
  final ConquerProducts product;
  const _ConquerProductRow({super.key, required this.product});

  @override
  State<_ConquerProductRow> createState() => _ConquerProductRowState();
}

class _ConquerProductRowState extends State<_ConquerProductRow> {
  String imagePath = '';
  Timer? _timer;
  StreamSubscription? _subscription;
  @override
  void initState() {
    _getImagePath();
    super.initState();
  }
    @override
  void dispose() {
    _timer?.cancel();
    _subscription?.cancel();
    super.dispose();
  }
 Future<void> _getImagePath() async {
  String imagen = await context.read<DataCubit>().getImagePath(
    widget.product.attributeName,
    widget.product.iconFrames[0]
  );
  if (mounted) {
    setState(() {
      imagePath = imagen;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Card(
      color: Colors.grey.shade200,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: 
             Image.file(
        File(imagePath),
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
      if (wasSynchronouslyLoaded) return child;
      return AnimatedOpacity(
        opacity: frame == null ? 0 : 1,
        duration: const Duration(seconds: 1),
        curve: Curves.easeOut,
        child: child,
      );
        },
        errorBuilder: (context, error, stackTrace) {
      return const Icon(Icons.error);
        },
        height: 50,
        width: 50,
      ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                  Row(
                    children: [
                      Text(widget.product.attributeName, style: text.titleSmall!.copyWith(color: Color(FormatProduct.getAttributeColor(widget.product.qualityName.name))),),
                      widget.product.additionLevel > 0 ? Text(' +${widget.product.additionLevel}',style: text.titleSmall!.copyWith(color: Color(FormatProduct.getAttributeColor(widget.product.qualityName.name)))) : const SizedBox(),
                    ],
                  ),
                  widget.product.itemMajorClass == ItemMajorClass.GEM || widget.product.itemMajorClass == ItemMajorClass.OTHERS ?const SizedBox() :
                  Row(
                    children: [
                      const Text('GEM1: '),
                      Text(FormatProduct.formatGem(widget.product.gem1)),
                      const SizedBox(width: 20,),
                      const Text('GEM2: '),
                      Text(FormatProduct.formatGem(widget.product.gem2)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Price: \$'),
                      Text(FormatProduct.formatPrice(widget.product.price)),
                    ],
                  ),
                    Row(
                    children: [
                      const Text('Lat :'),
                      Text('${widget.product.positionX}'),
                      const SizedBox(width: 20,),
                      const Text('Long :'),
                      Text('${widget.product.positionY}'),
                    ],
                  ),
                   Row(
                    children: [
                     const Text('seller :'),
                      Text(widget.product.sellerName),
                    ],
                  ),
                   Row(
                    children: [
                
                      Text('${widget.product.serverName}'),
                      
                    ],
                  )
              ],
            ),
          )
        ]
      ),
    );
  }
}



//  Row(
//       children: [
//        Image.file(
//   File(imagePath),
//   frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
//     if (wasSynchronouslyLoaded) return child;
//     return AnimatedOpacity(
//       opacity: frame == null ? 0 : 1,
//       duration: const Duration(seconds: 1),
//       curve: Curves.easeOut,
//       child: child,
//     );
//   },
//   errorBuilder: (context, error, stackTrace) {
//     print('Error al cargar la imagen: $error');
//     return const Icon(Icons.error);
//   },
//   width: 30, // Ajusta según tus necesidades
//   height: 30,
//   fit: BoxFit.cover,
// ),
//         Text(widget.product.attributeName, style: text.titleSmall!.copyWith(color: Color(FormatProduct.getAttributeColor(widget.product.qualityName.name))),),
//         widget.product.itemMajorClass == ItemMajorClass.GEM || widget.product.itemMajorClass == ItemMajorClass.OTHERS ?const SizedBox() : Text(FormatProduct.formatGem(widget.product.gem1)),
//         widget.product.itemMajorClass == ItemMajorClass.GEM || widget.product.itemMajorClass == ItemMajorClass.OTHERS ? const SizedBox() : Text(FormatProduct.formatGem(widget.product.gem2)), 
//         Text(widget.product.price.toString()),
//       ],
//     );