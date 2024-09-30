import '../infrastructure/conquer_products.dart';

class ConquerProducts {
    final int itemId;
    final String sellerName;
    final int positionX;
    final int positionY;
    final int attributeId;
    final String attributeName;
    final QualityName qualityName;
    final Gem gem1;
    final Gem gem2;
    final WeaponMagic weaponMagic;
    final int additionLevel;
    final int price;
    final ItemMajorClass itemMajorClass;
    final ItemMinorClass itemMinorClass;
    final List<String> iconFrames;
    final ServerName serverName;

    ConquerProducts({
        required this.itemId,
        required this.sellerName,
        required this.positionX,
        required this.positionY,
        required this.attributeId,
        required this.attributeName,
        required this.qualityName,
        required this.gem1,
        required this.gem2,
        required this.weaponMagic,
        required this.additionLevel,
        required this.price,
        required this.itemMajorClass,
        required this.itemMinorClass,
        required this.iconFrames,
        required this.serverName,
    });
}