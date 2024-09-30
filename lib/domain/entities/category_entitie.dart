import '../infrastructure/conquer_products.dart';

class Category {
    final int id;
    final String label;
    final ItemMajorClass? value;

    Category({
        required this.id,
        required this.label,
        required this.value,
    });
}