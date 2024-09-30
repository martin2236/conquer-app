// To parse this JSON data, do
//
//     final conquerProductsDb = conquerProductsDbFromJson(jsonString);


import 'dart:convert';

List<ConquerProductsDb> conquerProductsDbFromJson(dynamic data) {
  try {
    var list = List<ConquerProductsDb>.from(
        data.map((x) => ConquerProductsDb.fromJson(x)));
    return list;
  } catch (e, stacktrace) {
    print('Error al convertir el JSON: $e');
    print('Stacktrace: $stacktrace');
    return [];
  }
}


String conquerProductsDbToJson(List<ConquerProductsDb> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ConquerProductsDb {
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

    ConquerProductsDb({
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

   factory ConquerProductsDb.fromJson(Map<String, dynamic> json) => ConquerProductsDb(
        itemId: json["ItemId"],
        sellerName: json["SellerName"],
        positionX: json["PositionX"],
        positionY: json["PositionY"],
        attributeId: json["AttributeId"],
        attributeName: json["AttributeName"],
        qualityName: qualityNameValues.map[json["QualityName"]] ?? QualityName.EMPTY,
        gem1: gemValues.map[json["Gem1"]] ?? Gem.NONE,
        gem2: gemValues.map[json["Gem2"]] ?? Gem.NONE,
        weaponMagic: weaponMagicValues.map[json["WeaponMagic"]] ?? WeaponMagic.NONE,
        additionLevel: json["AdditionLevel"],
        price: json["Price"],
        itemMajorClass: itemMajorClassValues.map[json["ItemMajorClass"]] ?? ItemMajorClass.OTHERS,
        itemMinorClass: itemMinorClassValues.map[json["ItemMinorClass"]] ?? ItemMinorClass.OTHER,
        iconFrames: List<String>.from(json["IconFrames"].map((x) => x)),
        serverName: serverNameValues.map[json["ServerName"]] ?? ServerName.CLASSIC_US,
    );

    Map<String, dynamic> toJson() => {
        "ItemId": itemId,
        "SellerName": sellerName,
        "PositionX": positionX,
        "PositionY": positionY,
        "AttributeId": attributeId,
        "AttributeName": attributeName,
        "QualityName": qualityNameValues.reverse[qualityName],
        "Gem1": gemValues.reverse[gem1],
        "Gem2": gemValues.reverse[gem2],
        "WeaponMagic": weaponMagicValues.reverse[weaponMagic],
        "AdditionLevel": additionLevel,
        "Price": price,
        "ItemMajorClass": itemMajorClassValues.reverse[itemMajorClass],
        "ItemMinorClass": itemMinorClassValues.reverse[itemMinorClass],
        "IconFrames": List<dynamic>.from(iconFrames.map((x) => x)),
        "ServerName": serverNameValues.reverse[serverName],
    };
}

enum Gem {
    EMPTY,
    NONE,
    NORMAL_KYLIN_GEM,
    NORMAL_DRAGON_GEM,
    NORMAL_PHOENIX_GEM,
    NORMAL_RAINBOW_GEM,
    NORMAL_VIOLET_GEM,
    NORMAL_MOON_GEM,
    REFINED_DRAGON_GEM,
    REFINED_KYLIN_GEM,
    REFINED_MOON_GEM,
    REFINED_RAINBOW_GEM,
    REFINED_VIOLET_GEM,
    REFINED_PHOENIX_GEM,
    SUPER_DRAGON_GEM,
    SUPER_KYLIN_GEM,
    SUPER_MOON_GEM,
    SUPER_PHOENIX_GEM,
    SUPER_RAINBOW_GEM,
    SUPER_VIOLET_GEM
}

final gemValues = EnumValues({
    "Empty": Gem.EMPTY,
    "None": Gem.NONE,
    "NormalDragonGem": Gem.NORMAL_DRAGON_GEM,
    "NormalPhoenixGem": Gem.NORMAL_PHOENIX_GEM,
    "NormalRainbowGem": Gem.NORMAL_RAINBOW_GEM,
    "NormalVioletGem": Gem.NORMAL_VIOLET_GEM,
    "NormalMoonGem": Gem.NORMAL_MOON_GEM,
    "NormalKylinGem": Gem.NORMAL_KYLIN_GEM,
    "RefinedDragonGem": Gem.REFINED_DRAGON_GEM,
    "RefinedKylinGem": Gem.REFINED_KYLIN_GEM,
    "RefinedMoonGem": Gem.REFINED_MOON_GEM,
    "RefinedRainbowGem": Gem.REFINED_RAINBOW_GEM,
    "RefinedVioletGem": Gem.REFINED_VIOLET_GEM,
    "RefinedPhoenixGem": Gem.REFINED_PHOENIX_GEM,
    "SuperDragonGem": Gem.SUPER_DRAGON_GEM,
    "SuperKylinGem": Gem.SUPER_KYLIN_GEM,
    "SuperMoonGem": Gem.SUPER_MOON_GEM,
    "SuperPhoenixGem": Gem.SUPER_PHOENIX_GEM,
    "SuperRainbowGem": Gem.SUPER_RAINBOW_GEM,
    "SuperVioletGem": Gem.SUPER_VIOLET_GEM
});

enum ItemMajorClass {
    ARMOR,
    BOOTS,
    GEM,
    HEADGEAR,
    NECKLACE_BAG,
    OTHERS,
    RING_BRACELET,
    VALUABLES,
    WEAPON
}

final itemMajorClassValues = EnumValues({
    "Armor": ItemMajorClass.ARMOR,
    "Boots": ItemMajorClass.BOOTS,
    "Gem": ItemMajorClass.GEM,
    "Headgear": ItemMajorClass.HEADGEAR,
    "Necklace Bag": ItemMajorClass.NECKLACE_BAG,
    "Others": ItemMajorClass.OTHERS,
    "Ring Bracelet": ItemMajorClass.RING_BRACELET,
    "Valuables": ItemMajorClass.VALUABLES,
    "Weapon": ItemMajorClass.WEAPON
});

enum ItemMinorClass {
    ARCHER_COAT,
    ARCHER_HAT,
    AXE,
    BACKSWORD,
    BAG,
    BLADE,
    BOOTS,
    BOW,
    BRACELET,
    CLUB,
    DAGGER,
    DRAGON_BALL,
    DRAGON_CLAW,
    DRAGON_GEM,
    EARRING,
    FURY_GEM,
    GLAIVE,
    HALBERT,
    HAMMER,
    HEAVY_RING,
    HOOK,
    KYLIN_GEM,
    LONG_HAMMER,
    MOON_GEM,
    NECKLACE,
    OTHER,
    PACK,
    PHOENIX_GEM,
    POLEAXE,
    POTION,
    QUEST_ITEM,
    RAINBOW_GEM,
    RING,
    SCEPTER,
    SHIELD,
    SKILL_BOOK,
    SPEAR,
    SWORD,
    TAOIST_CAP,
    TAOIST_ROBE,
    TROJAN_ARMOR,
    TROJAN_CORONET,
    VIOLET_GEM,
    WAND,
    WARRIOR_ARMOR,
    WARRIOR_HELMET,
    WHIP
}

final itemMinorClassValues = EnumValues({
    "Archer Coat": ItemMinorClass.ARCHER_COAT,
    "Archer Hat": ItemMinorClass.ARCHER_HAT,
    "Axe": ItemMinorClass.AXE,
    "Backsword": ItemMinorClass.BACKSWORD,
    "Bag": ItemMinorClass.BAG,
    "Blade": ItemMinorClass.BLADE,
    "Boots": ItemMinorClass.BOOTS,
    "Bow": ItemMinorClass.BOW,
    "Bracelet": ItemMinorClass.BRACELET,
    "Club": ItemMinorClass.CLUB,
    "Dagger": ItemMinorClass.DAGGER,
    "Dragon Ball": ItemMinorClass.DRAGON_BALL,
    "Dragon Claw": ItemMinorClass.DRAGON_CLAW,
    "Dragon Gem": ItemMinorClass.DRAGON_GEM,
    "Earring": ItemMinorClass.EARRING,
    "Fury Gem": ItemMinorClass.FURY_GEM,
    "Glaive": ItemMinorClass.GLAIVE,
    "Halbert": ItemMinorClass.HALBERT,
    "Hammer": ItemMinorClass.HAMMER,
    "Heavy Ring": ItemMinorClass.HEAVY_RING,
    "Hook": ItemMinorClass.HOOK,
    "Kylin Gem": ItemMinorClass.KYLIN_GEM,
    "Long Hammer": ItemMinorClass.LONG_HAMMER,
    "Moon Gem": ItemMinorClass.MOON_GEM,
    "Necklace": ItemMinorClass.NECKLACE,
    "Other": ItemMinorClass.OTHER,
    "Pack": ItemMinorClass.PACK,
    "Phoenix Gem": ItemMinorClass.PHOENIX_GEM,
    "Poleaxe": ItemMinorClass.POLEAXE,
    "Potion": ItemMinorClass.POTION,
    "Quest Item": ItemMinorClass.QUEST_ITEM,
    "Rainbow Gem": ItemMinorClass.RAINBOW_GEM,
    "Ring": ItemMinorClass.RING,
    "Scepter": ItemMinorClass.SCEPTER,
    "Shield": ItemMinorClass.SHIELD,
    "Skill Book": ItemMinorClass.SKILL_BOOK,
    "Spear": ItemMinorClass.SPEAR,
    "Sword": ItemMinorClass.SWORD,
    "Taoist Cap": ItemMinorClass.TAOIST_CAP,
    "Taoist Robe": ItemMinorClass.TAOIST_ROBE,
    "Trojan Armor": ItemMinorClass.TROJAN_ARMOR,
    "Trojan Coronet": ItemMinorClass.TROJAN_CORONET,
    "Violet Gem": ItemMinorClass.VIOLET_GEM,
    "Wand": ItemMinorClass.WAND,
    "Warrior Armor": ItemMinorClass.WARRIOR_ARMOR,
    "Warrior Helmet": ItemMinorClass.WARRIOR_HELMET,
    "Whip": ItemMinorClass.WHIP
});

enum QualityName {
    ELITE,
    EMPTY,
    FIXED,
    NORMAL,
    REFINED,
    SUPER,
    UNIQUE
}

final qualityNameValues = EnumValues({
    "Elite": QualityName.ELITE,
    "": QualityName.EMPTY,
    "Fixed": QualityName.FIXED,
    "Normal": QualityName.NORMAL,
    "Refined": QualityName.REFINED,
    "Super": QualityName.SUPER,
    "Unique": QualityName.UNIQUE
});

enum ServerName {
    CLASSIC_EU,
    CLASSIC_MURICA,
    CLASSIC_US
}

final serverNameValues = EnumValues({
    "Classic_EU": ServerName.CLASSIC_EU,
    "Classic_Murica": ServerName.CLASSIC_MURICA,
    "Classic_US": ServerName.CLASSIC_US
});

enum WeaponMagic {
    IMPROVE_DEFENSE,
    NONE,
    POISON_TARGET,
    RECOVER_HP,
    RECOVER_MANA
}

final weaponMagicValues = EnumValues({
    "Improve Defense": WeaponMagic.IMPROVE_DEFENSE,
    "None": WeaponMagic.NONE,
    "Poison Target": WeaponMagic.POISON_TARGET,
    "Recover HP": WeaponMagic.RECOVER_HP,
    "Recover Mana": WeaponMagic.RECOVER_MANA
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
