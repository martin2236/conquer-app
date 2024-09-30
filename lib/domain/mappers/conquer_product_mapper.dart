import 'package:conquer/domain/entities/conquer_products_entitie.dart';
import 'package:conquer/domain/infrastructure/conquer_products.dart';

class ConquerProductMapper {
static  ConquerProducts conquerProductsdbAEntidad(ConquerProductsDb db) {
    return ConquerProducts(
      itemId: db.itemId,
      sellerName: db.sellerName,
      positionX: db.positionX,
      positionY: db.positionY,
      attributeId: db.attributeId,
      attributeName: db.attributeName,
      qualityName: db.qualityName,
      gem1: db.gem1,
      gem2: db.gem2,
      weaponMagic: db.weaponMagic,
      additionLevel: db.additionLevel,
      price: db.price,
      itemMajorClass: db.itemMajorClass,
      itemMinorClass: db.itemMinorClass,
      iconFrames: db.iconFrames,
      serverName: db.serverName,
    ) ;
  }
}