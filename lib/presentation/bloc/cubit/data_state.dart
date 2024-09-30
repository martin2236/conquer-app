part of 'data_cubit.dart';


class DataCubitState extends Equatable {
  final List<ConquerProducts> productosOriginales;
  final List<ConquerProducts> productosFiltrados;
  final Map<String, dynamic> activeFilters;
   final ServerName? currentServer;
  final int? server;
  final int? category;
  final int? quality;
  final int? subCategory;
  final int? plus;
  final int? price;
  final int? socket1;
  final int? socket2;


 const DataCubitState(
   { 
  this.server , 
  this.category,
  this.subCategory,
  this.quality, 
  this.plus, 
  this.socket1, 
  this.socket2,
  this.productosOriginales = const [], 
  this.productosFiltrados = const [],
  this.activeFilters = const {},
  this.price, 
  this.currentServer,
  });

 DataCubitState copyWith({
  List<ConquerProducts>? productosOriginales,
  List<ConquerProducts>? productosFiltrados,
  int? server,
  int? category,
  int? subCategory,
  int? quality,
  Map<String, dynamic>? activeFilters,
  int? plus,
  int? price,
  int? socket1,
  int? socket2,
  }) => DataCubitState(
    price: price ?? this.price,
    productosOriginales: productosOriginales ?? this.productosOriginales,
    productosFiltrados: productosFiltrados ?? this.productosFiltrados,
    server: server ?? this.server,
    category: category ?? this.category,
    subCategory: subCategory ?? this.subCategory,
    quality: quality ?? this.quality,
    activeFilters: activeFilters ?? this.activeFilters,
    plus: plus ?? this.plus,
    socket1: socket1 ?? this.socket1,
    socket2: socket2 ?? this.socket2,
    );

  @override
  List<Object?> get props => [price,subCategory,productosOriginales, productosFiltrados, server, category, quality, plus, socket1, socket2, activeFilters, currentServer];
  
}

