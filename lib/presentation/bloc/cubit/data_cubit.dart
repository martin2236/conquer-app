import 'dart:io';
import 'dart:typed_data';

import 'package:conquer/domain/mappers/conquer_product_mapper.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqlite_api.dart';
import '../../../domain/entities/conquer_products_entitie.dart';
import '../../../domain/infrastructure/conquer_products.dart';

part 'data_state.dart';

enum PriceFilter {
  any,
  cheapest,
  mostExpensive
}
class DataCubit extends Cubit<DataCubitState> {
  final Database db;
  DataCubit({required this.db}) : super(const DataCubitState());
  final Dio dio = Dio();
 Future<(bool,String)> traerProductosDelMaeket() async {
   try {
      final response = await dio.get('https://conqueronline.net/Community/GetItems');
      final jsonData = response.data;
    print(jsonData);
      final List<ConquerProductsDb> conquerProductsDb = conquerProductsDbFromJson(jsonData);
   
      final List<ConquerProducts> conquerProducts = conquerProductsDb.map((conquerProductDb)=> ConquerProductMapper.conquerProductsdbAEntidad(conquerProductDb)).toList();
  print('CONQUER PRODUCTS ${conquerProducts.length}');
    emit(state.copyWith(
      productosOriginales: conquerProducts,
      ));


    return (true,'productos obtenidos');
   } catch (e) {
     return (false,'error al obtener productos');
   }
  }

 Future<String> getImagePath(int itemId, String iconFrame) async {
  // Buscar en la base de datos local
  final result = await db.query(
    'item_images',
    where: 'item_id = ?',
    whereArgs: [itemId],
  );

  if (result.isNotEmpty) {
    // La imagen existe en la base de datos
    String imagePath = result.first['image_path'] as String;
    
    if (await File(imagePath).exists()) {
      print('Imagen encontrada localmente: $imagePath');
      return imagePath;
    }
    await db.delete(
      'item_images',
      where: 'item_id = ?',
      whereArgs: [itemId],
    );
    print('Registro eliminado de la base de datos para itemId: $itemId');
  }

  print('Descargando imagen para itemId: $itemId');
  return await _downloadAndSaveImage(itemId, iconFrame);
}

Future<String> _downloadAndSaveImage(int itemId, String iconFrame) async {
  final response = await dio.get(
    'https://download.conqueronline.net/items/$iconFrame',
    options: Options(responseType: ResponseType.bytes),
  );

  if (response.statusCode == 200) {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final filePath = '${documentsDirectory.path}/$itemId.png';
    Uint8List imageBytes = response.data;

    await File(filePath).writeAsBytes(imageBytes);

    try {
      await db.insert('item_images', {
        'item_id': itemId,
        'image_path': filePath,
      });
    } catch (e) {
      print('Error al insertar en la base de datos: $e');
      // Si falla la inserción, intentamos actualizar
      await db.update(
        'item_images',
        {'image_path': filePath},
        where: 'item_id = ?',
        whereArgs: [itemId],
      );
    }

    return filePath;
  } else {
    throw Exception('Error al descargar la imagen');
  }
}



 void saveFilters(String filter, dynamic value) {
    final newFilters = Map<String, dynamic>.from(state.activeFilters);
  
    if (value != null) {
      newFilters[filter] = value;
    } else {
      newFilters.remove(filter);
    }
      
    emit(state.copyWith(activeFilters: newFilters));
    applyFilters();
  }

 

    void applyFilters() {
    List<ConquerProducts> filteredProducts = state.productosOriginales;

    state.activeFilters.forEach((filter, value) {
      print(value);
      switch (filter) {
        case 'server':
          filteredProducts = state.productosOriginales.where((product) => product.serverName == value).toList();
          break;
        case 'category':
          filteredProducts = filteredProducts.where((product) => product.itemMajorClass == value).toList();
          break;
        case 'subCategory':
          filteredProducts = filteredProducts.where((product) => product.itemMinorClass == value).toList();
          break;
        case 'quality':
          filteredProducts = filteredProducts.where((product) => product.qualityName == value).toList();
          break;
        case 'plus':
          filteredProducts = filteredProducts.where((product) => product.additionLevel == value).toList();
          break;
        case 'price':
          filteredProducts = sortByPrice(filteredProducts, value);
          break;
        case 'socket1':
          filteredProducts = filteredProducts.where((product) => product.gem1 == value).toList();
          break;
        case 'socket2':
          filteredProducts = filteredProducts.where((product) => product.gem2 == value).toList();
          break;
      }
    });

   

    emit(state.copyWith(productosFiltrados: filteredProducts));
  }

  List<ConquerProducts> sortByPrice( List<ConquerProducts> filteredProducts, String priceFilter) {
     switch (priceFilter) {
      case 'CHEAPEST':
        filteredProducts.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'MOST EXPENSIVE':
        filteredProducts.sort((a, b) => b.price.compareTo(a.price));
        break;
    }
    return filteredProducts;
  }

void saveDropdownValue(String filter, int? value){
  switch(filter){
    case 'server':
     emit(state.copyWith(server: value));
      break;
    case 'category':
      emit(state.copyWith(category: value));
      break;
    case 'subCategory':
      emit(state.copyWith(subCategory: value));
      break;
    case 'quality':
      emit(state.copyWith(quality: value ));
      break;
    case 'plus':
      emit(state.copyWith(plus: value));
      break;
    case 'price':
      emit(state.copyWith(price: value));
      break;
    case 'socket1':
      emit(state.copyWith(socket1: value ));
      break;
    case 'socket2':
      emit(state.copyWith(socket2: value ));
      break;
  }
}
}



