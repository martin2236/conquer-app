import '../infrastructure/conquer_products.dart';

class SubCategory {
    final int id;
    final String label;
    final ItemMajorClass? majorClass;
    final ItemMinorClass? value;

    SubCategory({
        required this.id,
        required this.label,
        required this.majorClass,
        required this.value,
    });
}