import 'package:conquer/domain/entities/quality_entitie.dart';
import 'package:conquer/domain/entities/socket_entitie.dart';
import 'package:conquer/domain/infrastructure/conquer_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/category_entitie.dart';
import '../../domain/entities/plus_entitie.dart';
import '../../domain/entities/price_entitie.dart';
import '../../domain/entities/server_entitie.dart';
import '../../domain/entities/sub_category_entitie.dart';
import '../bloc/cubit/data_cubit.dart';
import 'imputs/custom_dropdown.dart';

final List<Server> servers = [
  Server(id: 1,label: 'Classic_US', name: ServerName.CLASSIC_US),
  Server(id: 2, label: 'Classic_EU', name: ServerName.CLASSIC_EU),
  Server(id: 3, label: 'Classic_MURICA', name: ServerName.CLASSIC_MURICA),
];

final List<Category> categories = [
  Category(id: 0,label: 'ANY', value: null),
  Category(id: 1,label: 'WEAPON', value: ItemMajorClass.WEAPON),
  Category(id: 2, label: 'ARMOR', value: ItemMajorClass.ARMOR),
  Category(id: 3, label: 'RING BRACELET', value: ItemMajorClass.RING_BRACELET),
  Category(id: 4, label: 'OTHERS', value: ItemMajorClass.OTHERS),
  Category(id: 5, label: 'VALUABLES', value: ItemMajorClass.VALUABLES),
  Category(id: 6, label: 'NECKLACE BAG', value: ItemMajorClass.NECKLACE_BAG),
  Category(id: 8, label: 'GEM', value: ItemMajorClass.GEM),
  Category(id: 9, label: 'HEADGEAR', value: ItemMajorClass.HEADGEAR),
  Category(id: 10, label: 'BOOTS', value: ItemMajorClass.BOOTS),
];

final List<SubCategory> subCategories = [
  SubCategory(id: 0, label: 'ANY', value: null, majorClass: null),
  SubCategory(id: 1, label: 'ARCHER_COAT', majorClass: ItemMajorClass.ARMOR, value: ItemMinorClass.ARCHER_COAT),
  SubCategory(id: 2, label: 'ARCHER_HAT', majorClass: ItemMajorClass.HEADGEAR, value: ItemMinorClass.ARCHER_HAT),
  SubCategory(id: 3, label: 'AXE', majorClass: ItemMajorClass.WEAPON, value: ItemMinorClass.AXE),
  SubCategory(id: 4, label: 'BACKSWORD', majorClass: ItemMajorClass.WEAPON, value: ItemMinorClass.BACKSWORD),
  SubCategory(id: 5, label: 'BAG', majorClass: ItemMajorClass.NECKLACE_BAG, value: ItemMinorClass.BAG),
  SubCategory(id: 6, label: 'BLADE', majorClass: ItemMajorClass.WEAPON, value: ItemMinorClass.BLADE),
  SubCategory(id: 7, label: 'BOOTS', majorClass: ItemMajorClass.BOOTS, value: ItemMinorClass.BOOTS),
  SubCategory(id: 8, label: 'BOW',majorClass: ItemMajorClass.WEAPON, value: ItemMinorClass.BOW),
  SubCategory(id: 9, label: 'BRACELET', majorClass: ItemMajorClass.RING_BRACELET, value: ItemMinorClass.BRACELET),
  SubCategory(id: 10, label: 'CLUB', majorClass: ItemMajorClass.WEAPON, value: ItemMinorClass.CLUB),
  SubCategory(id: 11, label: 'DAGGER', majorClass: ItemMajorClass.WEAPON, value: ItemMinorClass.DAGGER),
  SubCategory(id: 12, label: 'DRAGON_BALL', majorClass: ItemMajorClass.VALUABLES, value: ItemMinorClass.DRAGON_BALL),
  SubCategory(id: 13, label: 'DRAGON_CLAW', majorClass: ItemMajorClass.VALUABLES, value: ItemMinorClass.DRAGON_CLAW),
  SubCategory(id: 14, label: 'DRAGON_GEM', majorClass: ItemMajorClass.GEM, value: ItemMinorClass.DRAGON_GEM),
  SubCategory(id: 15, label: 'EARRING', majorClass: ItemMajorClass.HEADGEAR, value: ItemMinorClass.EARRING),
  SubCategory(id: 16, label: 'FURY_GEM', majorClass: ItemMajorClass.GEM, value: ItemMinorClass.FURY_GEM),
  SubCategory(id: 17, label: 'GLAIVE', majorClass: ItemMajorClass.WEAPON, value: ItemMinorClass.GLAIVE),
  SubCategory(id: 18, label: 'HALBERT', majorClass: ItemMajorClass.WEAPON, value: ItemMinorClass.HALBERT),
  SubCategory(id: 19, label: 'HAMMER', majorClass: ItemMajorClass.WEAPON, value: ItemMinorClass.HAMMER),
  SubCategory(id: 20, label: 'HEAVY_RING', majorClass: ItemMajorClass.RING_BRACELET, value: ItemMinorClass.HEAVY_RING),
  SubCategory(id: 21, label: 'HOOK', majorClass: ItemMajorClass.WEAPON, value: ItemMinorClass.HOOK),
  SubCategory(id: 22, label: 'KYLIN_GEM', majorClass: ItemMajorClass.GEM, value: ItemMinorClass.KYLIN_GEM),
  SubCategory(id: 22, label: 'LONG HAMMER', majorClass: ItemMajorClass.WEAPON, value: ItemMinorClass.LONG_HAMMER),
  SubCategory(id: 23, label: 'MOON_GEM', majorClass: ItemMajorClass.GEM, value: ItemMinorClass.MOON_GEM),
  SubCategory(id: 24, label: 'NECKLACE', majorClass: ItemMajorClass.NECKLACE_BAG, value: ItemMinorClass.NECKLACE),
  SubCategory(id: 25, label: 'OTHER', majorClass: ItemMajorClass.OTHERS, value: ItemMinorClass.OTHER),
  SubCategory(id: 26, label: 'PACK', majorClass: ItemMajorClass.OTHERS, value: ItemMinorClass.PACK),
  SubCategory(id: 27, label: 'PHOENIX_GEM', majorClass: ItemMajorClass.GEM, value: ItemMinorClass.PHOENIX_GEM),
  SubCategory(id: 28, label: 'POLEAXE', majorClass: ItemMajorClass.WEAPON, value: ItemMinorClass.POLEAXE),
  SubCategory(id: 29, label: 'POTION', majorClass: ItemMajorClass.OTHERS, value: ItemMinorClass.POTION),
  SubCategory(id: 30, label: 'QUEST_ITEM', majorClass: ItemMajorClass.OTHERS, value: ItemMinorClass.QUEST_ITEM),
  SubCategory(id: 31, label: 'RAINBOW_GEM', majorClass: ItemMajorClass.GEM, value: ItemMinorClass.RAINBOW_GEM),
  SubCategory(id: 32, label: 'RING', majorClass: ItemMajorClass.RING_BRACELET, value: ItemMinorClass.RING),
  SubCategory(id: 33, label: 'SCEPTER', majorClass: ItemMajorClass.WEAPON, value: ItemMinorClass.SCEPTER),
  SubCategory(id: 34, label: 'SHIELD', majorClass: ItemMajorClass.WEAPON, value: ItemMinorClass.SHIELD),
  SubCategory(id: 35, label: 'SKILL_BOOK', majorClass: ItemMajorClass.OTHERS, value: ItemMinorClass.SKILL_BOOK),
  SubCategory(id: 36, label: 'SPEAR', majorClass: ItemMajorClass.WEAPON, value: ItemMinorClass.SPEAR),
  SubCategory(id: 37, label: 'SWORD', majorClass: ItemMajorClass.WEAPON, value: ItemMinorClass.SWORD),
  SubCategory(id: 38, label: 'TAOIST_CAP', majorClass: ItemMajorClass.HEADGEAR, value: ItemMinorClass.TAOIST_CAP),
  SubCategory(id: 39, label: 'TAOIST_ROBE', majorClass: ItemMajorClass.ARMOR, value: ItemMinorClass.TAOIST_ROBE),
  SubCategory(id: 40, label: 'TROJAN_ARMOR', majorClass: ItemMajorClass.ARMOR, value: ItemMinorClass.TROJAN_ARMOR),
  SubCategory(id: 41, label: 'TROJAN_CORONET', majorClass: ItemMajorClass.HEADGEAR, value: ItemMinorClass.TROJAN_CORONET),
  SubCategory(id: 42, label: 'VIOLET_GEM', majorClass: ItemMajorClass.GEM, value: ItemMinorClass.VIOLET_GEM),
  SubCategory(id: 43, label: 'WAND', majorClass: ItemMajorClass.WEAPON, value: ItemMinorClass.WAND),
  SubCategory(id: 44, label: 'WARRIOR_ARMOR', majorClass: ItemMajorClass.ARMOR, value: ItemMinorClass.WARRIOR_ARMOR),
  SubCategory(id: 45, label: 'WARRIOR_HELMET', majorClass: ItemMajorClass.HEADGEAR, value: ItemMinorClass.WARRIOR_HELMET),
  SubCategory(id: 46, label: 'WHIP', majorClass: ItemMajorClass.WEAPON, value: ItemMinorClass.WHIP),
  
  
  
];
final List<QualityEntitie> qualities = [
  QualityEntitie(id: 0,label: 'ANY', value: null),
  QualityEntitie(id: 1,label: 'NORMAL', value: QualityName.NORMAL),
  QualityEntitie(id: 4, label: 'REFINED', value: QualityName.REFINED),
  QualityEntitie(id: 5, label: 'UNIQUE', value: QualityName.UNIQUE),
  QualityEntitie(id: 6, label: 'ELITE', value: QualityName.ELITE),
  QualityEntitie(id: 7, label: 'SUPER', value: QualityName.SUPER),
];

final List<SocketEntitie> gems = [
  SocketEntitie(id: 0, label: 'ANY', value: null),
  SocketEntitie(id: 1, label: 'EMPTY', value: Gem.EMPTY),
  SocketEntitie(id: 2, label: 'NONE', value: Gem.NONE),
  SocketEntitie(id: 3, label: 'NORMAL KYLIN GEM', value: Gem.NORMAL_KYLIN_GEM),
  SocketEntitie(id: 4, label: 'NORMAL DRAGON GEM', value: Gem.NORMAL_DRAGON_GEM),
  SocketEntitie(id: 5, label: 'NORMAL MOON GEM', value: Gem.NORMAL_MOON_GEM),
  SocketEntitie(id: 6, label: 'NORMAL PHOENIX GEM', value: Gem.NORMAL_PHOENIX_GEM),
  SocketEntitie(id: 7, label: 'NORMAL RAINBOW GEM', value: Gem.NORMAL_RAINBOW_GEM),
  SocketEntitie(id: 8, label: 'NORMAL VIOLET GEM', value: Gem.NORMAL_VIOLET_GEM),
  SocketEntitie(id: 9, label: 'REFINED KYLIN GEM', value: Gem.REFINED_KYLIN_GEM),
  SocketEntitie(id: 10, label: 'REFINED DRAGON GEM', value: Gem.REFINED_DRAGON_GEM),
  SocketEntitie(id: 11, label: 'REFINED MOON GEM', value: Gem.REFINED_MOON_GEM),
  SocketEntitie(id: 12, label: 'REFINED PHOENIX GEM', value: Gem.REFINED_PHOENIX_GEM),
  SocketEntitie(id: 13, label: 'REFINED RAINBOW GEM', value: Gem.REFINED_RAINBOW_GEM),
  SocketEntitie(id: 14, label: 'REFINED VIOLET GEM', value: Gem.REFINED_VIOLET_GEM),
  SocketEntitie(id: 15, label: 'SUPER KYLIN GEM', value: Gem.SUPER_KYLIN_GEM),
  SocketEntitie(id: 16, label: 'SUPER DRAGON GEM', value: Gem.SUPER_DRAGON_GEM),
  SocketEntitie(id: 17, label: 'SUPER MOON GEM', value: Gem.SUPER_MOON_GEM),
  SocketEntitie(id: 18, label: 'SUPER PHOENIX GEM', value: Gem.SUPER_PHOENIX_GEM),
  SocketEntitie(id: 19, label: 'SUPER RAINBOW GEM', value: Gem.SUPER_RAINBOW_GEM),
  SocketEntitie(id: 20, label: 'SUPER VIOLET GEM', value: Gem.SUPER_VIOLET_GEM),
];  

final List<PlusEntitie> plus = [
  PlusEntitie(id: 1, label: 'ANY', value: null),
  PlusEntitie(id: 2, label: '+1', value: 1),
  PlusEntitie(id: 3, label: '+2', value: 2),
  PlusEntitie(id: 4, label: '+3', value: 3),
  PlusEntitie(id: 5, label: '+4', value: 4),
  PlusEntitie(id: 6, label: '+5', value: 5),
  PlusEntitie(id: 7, label: '+6', value: 6),
  PlusEntitie(id: 8, label: '+7', value: 7),
  PlusEntitie(id: 9, label: '+8', value: 8),
  PlusEntitie(id: 10, label: '+9', value: 9),
];

final List<PriceEntitie> prices = [
  PriceEntitie(id: 1, label: 'ANY', value: null),
  PriceEntitie(id: 2, label: 'CHEAPEST', value: 'CHEAPEST'),
  PriceEntitie(id: 3, label: 'MOST EXPENSIVE', value: 'MOST EXPENSIVE'),
];
class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int? serverSelected ;
  int? categorySelected;
  int? qualitySelected;
  int? gemSelected;
  int? gemSelected2;
  int? plusSelected;
  int? priceSelected;
  int? subCategorySelected;
  @override
  void initState() {
   final state = context.read<DataCubit>().state;
  serverSelected = state.server;
  categorySelected = state.category;
  qualitySelected = state.quality;
  gemSelected = state.socket1;
  gemSelected2 = state.socket2;
  plusSelected = state.plus;
  priceSelected = state.price;
  subCategorySelected = state.subCategory;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final state = context.watch<DataCubit>().state;
    final  category = state.category;
     return  Drawer(
       child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
            ),
            child:const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Center(
                child: Text('Classic Conquer', style: TextStyle(color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold),),
               )
              ],
            ),
          ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10),
           child: Column(
            children: [
               _SelectServer(
                        server: servers,
                        serverSelected: serverSelected,
                        onChanged: (int? value) {
                           final selectedServer = servers.where((server) => server.id == value ).first;
                                  context.read<DataCubit>().saveDropdownValue('server', value);
                                 context.read<DataCubit>().saveFilters('server', selectedServer.name);
                        },
                      ),
              const SizedBox(height: 10,),
               _SelectCategory(
                        category: categories,
                        categorySelected: categorySelected,
                        onChanged: (int? value) {
                          setState(() {
                              final selectedCategory = categories.where((category) => category.id == value ).first;
                              context.read<DataCubit>().saveDropdownValue('category', value);
                              context.read<DataCubit>().saveDropdownValue('subCategory', null);
                          context.read<DataCubit>().saveFilters('category', selectedCategory.value);
                          });
                        },
                      ),
                      const  SizedBox(height: 10,),
                      category != null ?   
                      _SelectSubCategory(
                        subCategory: subCategories,
                        categories: categories,
                        subCategorySelected: subCategorySelected,
                        onChanged: (int? value) {
                          setState(() {
                              final selectedSubCategory = subCategories.where((subCategory) => subCategory.id == value ).first;
                              context.read<DataCubit>().saveDropdownValue('subCategory', value);
                          context.read<DataCubit>().saveFilters('subCategory', selectedSubCategory.value);
                          });
                        },
                      )
                      : const SizedBox(),

                SizedBox(height: category != null ? 10 : 0,),
              _SelectQuality(
                        quality: qualities,
                        qualitySelected: qualitySelected,
                        onChanged: (int? value) {
                         final selectedQuality = qualities.where((quality) => quality.id == value ).first;
                         context.read<DataCubit>().saveDropdownValue('quality', value);
                         context.read<DataCubit>().saveFilters('quality', selectedQuality.value);
                        },
                      ),
              const  SizedBox(height: 10,),
              _SelectPlus(
                        plus: plus,
                        plusSelected: plusSelected,
                        onChanged: (int? value) {
                            final selectedPlus = plus.where((plus) => plus.id == value ).first;
                            context.read<DataCubit>().saveDropdownValue('plus', value);
                            context.read<DataCubit>().saveFilters('plus', selectedPlus.value);
                        },
                      ),
                 const  SizedBox(height: 10,),
              _SelectGem(
                        gem: gems,
                        gemSelected: gemSelected,
                        onChanged: (int? value) {
                          final selectedGem = gems.where((gem) => gem.id == value ).first;
                          context.read<DataCubit>().saveDropdownValue('gem', value);
                          context.read<DataCubit>().saveFilters('gem', selectedGem.value);
                        },
                      ),
              const  SizedBox(height: 10,),
              
              _SelectGem2(
                        gem: gems,
                        gemSelected2: gemSelected2,
                        onChanged: (int? value) {
                          final selectedGem2 = gems.where((gem) => gem.id == value ).first;
                          context.read<DataCubit>().saveDropdownValue('gem2', value);
                          context.read<DataCubit>().saveFilters('gem2', selectedGem2.value);
                        },
                      ),
              const  SizedBox(height: 10,),
              _SelectPrice(
                        price: prices,
                        priceSelected: priceSelected,
                        onChanged: (int? value) {
                        final selectedPrice = prices.where((price) => price.id == value ).first;
                        context.read<DataCubit>().saveDropdownValue('price', value);
                        context.read<DataCubit>().saveFilters('price', selectedPrice.value);
                        },
                      ),
            
            ],
           ),
         )
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
  void initState() {
    super.initState();
    selectedOption = widget.serverSelected;
  }
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
      hint: 'Classic_US',
      value:selectedOption,
      onChanged: widget.onChanged,
      items: dropdownItemsRubro,
    );
  }
}

class _SelectCategory extends StatefulWidget {
  final List<Category>? category;
  final int? categorySelected;
  final void Function(int?)? onChanged;
  const _SelectCategory({
    required this.category,
    required this.categorySelected,
    required this.onChanged,
  });

  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<_SelectCategory> {
  int? selectedOption;
  @override
  void initState() {
    super.initState();
    selectedOption = widget.categorySelected;
  }
  @override
  Widget build(BuildContext context) {

    List<DropdownMenuItem<int>> dropdownItemsRubro =
        widget.category!.map((server) {
      return DropdownMenuItem<int>(
        value: server.id,
        child: Text(
          server.label,
          style: const TextStyle(fontSize: 14),
        ),
      );
    }).toList();
    return CustomDropdown( 
      label: 'CATEGORY',
      hint: 'WEAPONS',
      value:selectedOption,
      onChanged: widget.onChanged,
      items: dropdownItemsRubro,
    );
  }
}
class _SelectSubCategory extends StatelessWidget {
  final List<SubCategory> subCategory;
  final int? subCategorySelected;
  final void Function(int?)? onChanged;
  final List<Category> categories;

  const _SelectSubCategory({
    required this.subCategory,
    required this.subCategorySelected,
    required this.onChanged,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DataCubit>().state;
    final categorySelected = state.category; // Asumiendo que tienes un campo 'category' en tu estado

    final selectedMajorClass = categories
        .firstWhere((category) => category.id == categorySelected,
            orElse: () => Category(id: 0, label: 'ANY', value: null))
        .value;

    final filteredSubCategories = selectedMajorClass != null
        ? subCategory.where((subCat) => subCat.majorClass == selectedMajorClass).toList()
        : subCategory;

    List<DropdownMenuItem<int>> dropdownItemsRubro = [
      DropdownMenuItem<int>(
        value: 0,
        child: Text(
          'ANY',
          style: const TextStyle(fontSize: 14),
        ),
      ),
      ...filteredSubCategories.map((subCat) {
        return DropdownMenuItem<int>(
          value: subCat.id,
          child: Text(
            subCat.label,
            style: const TextStyle(fontSize: 14),
          ),
        );
      }).toList(),
    ];

    // Verificar si el valor seleccionado aún es válido
    final isSelectedValueValid = dropdownItemsRubro.any((item) => item.value == subCategorySelected);

    return CustomDropdown( 
      label: 'SUB CATEGORY',
      hint: 'ANY',
      value: isSelectedValueValid ? subCategorySelected : 0,
      onChanged: categorySelected != null ? onChanged : null,
      items: dropdownItemsRubro,
    );
  }
}
class _SelectQuality extends StatefulWidget {
  final List<QualityEntitie>? quality;
  final int? qualitySelected;
  final void Function(int?)? onChanged;
  const _SelectQuality({
    required this.quality,
    required this.qualitySelected,
    required this.onChanged,
  });

  @override
  _SelectQualityState createState() => _SelectQualityState();
}

class _SelectQualityState extends State<_SelectQuality> {
  int? selectedOption;
  @override
  void initState() {
    super.initState();
    selectedOption = widget.qualitySelected;
  }
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<int>> dropdownItemsRubro =
        widget.quality!.map((server) {
      return DropdownMenuItem<int>(
        value: server.id,
        child: Text(
          server.label,
          style: const TextStyle(fontSize: 14),
        ),
      );
    }).toList();
    return CustomDropdown( 
      label: 'QUALITY',
      hint: 'Any',
      value:selectedOption,
      onChanged: widget.onChanged,
      items: dropdownItemsRubro,
    );
  }
}
class _SelectGem extends StatefulWidget {
  final List<SocketEntitie>? gem;
  final int? gemSelected;
  final void Function(int?)? onChanged;
  const _SelectGem({required this.gem, required this.gemSelected, required this.onChanged});

  @override
  State<_SelectGem> createState() => _SelectGemState();
}

class _SelectGemState extends State<_SelectGem> {
   int? selectedOption;
   @override
   void initState() {
    super.initState();
    selectedOption = widget.gemSelected;
  }
  @override
  Widget build(BuildContext context) {
      List<DropdownMenuItem<int>> dropdownItemsRubro =
        widget.gem!.map((gem) {
      return DropdownMenuItem<int>(
        value: gem.id,
        child: Text(
          gem.label,
          style: const TextStyle(fontSize: 14),
        ),
      );
    }).toList();
    return CustomDropdown( 
      label: 'SOCKET 1',
      hint: 'None',
      value:selectedOption,
      onChanged: widget.onChanged,
      items: dropdownItemsRubro,
    );
  }
}

  class _SelectGem2 extends StatefulWidget {
  final List<SocketEntitie>? gem;
  final int? gemSelected2;
  final void Function(int?)? onChanged;
  const _SelectGem2({required this.gem, required this.gemSelected2, required this.onChanged});

  @override
  State<_SelectGem2> createState() => _SelectGem2State();
}

class _SelectGem2State extends State<_SelectGem2> {
   int? selectedOption;
   @override
   void initState() {
    super.initState();
    selectedOption = widget.gemSelected2;
  }
  @override
  Widget build(BuildContext context) {
      List<DropdownMenuItem<int>> dropdownItemsRubro =
        widget.gem!.map((gem) {
           
      return DropdownMenuItem<int>(
        value: gem.id,
        child: Text(
          gem.label,
          style: const TextStyle(fontSize: 14),
        ),
      );
    }).toList();
    return CustomDropdown( 
      label: 'SOCKET 2',
      hint: 'None',
      value:selectedOption,
      onChanged: widget.onChanged,
      items: dropdownItemsRubro,
    );
  }
}

  class _SelectPlus extends StatefulWidget {
  final List<PlusEntitie>? plus;
  final int? plusSelected;
  final void Function(int?)? onChanged;
  const _SelectPlus({required this.plus, required this.plusSelected, required this.onChanged});

  @override
  State<_SelectPlus> createState() => _SelectPlusState();
}

class _SelectPlusState extends State<_SelectPlus> {
   int? selectedOption;
   @override
   void initState() {
    super.initState();
    selectedOption = widget.plusSelected;
  }
  @override
  Widget build(BuildContext context) {
      List<DropdownMenuItem<int>> dropdownItemsRubro =
        widget.plus!.map((plus) {
      return DropdownMenuItem<int>(
        
        value: plus.id,
        child: Text(
         plus.label,
          style: const TextStyle(fontSize: 14),
        ),
      );
    }).toList();
    return CustomDropdown( 
      initialValue: context.read<DataCubit>().state.plus.toString(),
      label: 'PLUS',
      hint: 'None',
      value:selectedOption,
      onChanged: widget.onChanged,
      items: dropdownItemsRubro,
    );
  }
}

 class _SelectPrice extends StatefulWidget {
  final List<PriceEntitie>? price;
  final int? priceSelected;
  final void Function(int?)? onChanged;
  const _SelectPrice({required this.price, required this.priceSelected, required this.onChanged});

  @override
  State<_SelectPrice> createState() => _SelectPriceState();
}

class _SelectPriceState extends State<_SelectPrice> {
   int? selectedOption;
   @override
   void initState() {
    super.initState();
    selectedOption = widget.priceSelected;
  }
  @override
  Widget build(BuildContext context) {
      List<DropdownMenuItem<int>> dropdownItemsRubro =
        widget.price!.map((plus) {
      return DropdownMenuItem<int>(
        value: plus.id,
        child: Text(
          plus.value.toString(),
          style: const TextStyle(fontSize: 14),
        ),
      );
    }).toList();
    return CustomDropdown( 
      label: 'PRICE',
      hint: 'Any',
      value:selectedOption,
      onChanged: widget.onChanged,
      items: dropdownItemsRubro,
    );
  }
}