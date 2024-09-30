import 'package:conquer/domain/infrastructure/conquer_products.dart';

class QualityEntitie {
    final int id;
    final String label;
    final QualityName? value;

    QualityEntitie({
        required this.id,
        required this.label,
        required this.value,
    });
}