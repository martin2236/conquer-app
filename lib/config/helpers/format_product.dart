import '../../domain/infrastructure/conquer_products.dart';

class FormatProduct {

  static String formatGem(Gem gem) {
    if(gem.name.contains("_")) {
      List<String> gemName = gem.name.split("_");
      String iniciales = gemName.map((e) => e[0]).join("");
      return iniciales;
    }
    return '';
  }

  static int getAttributeColor(String quality) {
String firstTwoLetters = quality.substring(0, 2);
 switch(firstTwoLetters) {
  case "":
  return 0xFFFF000000;
  case "EM":
    return 0xFFFF000000;
  case "NO":
    return 0xFFFF000000;
  case "RE":
    return 0xFFFF3333FF;
  case "FI":
    return 0xFFFF3333FF;
  case "UN":
    return 0xFFFF006400;
  case "EL":
    return 0xFFFF800080; 
  case "SU":
    return 0xFFFFFFBF00; 
    //return 0xFFFFBF9B30; 
  default:
    return 0xFFFF3333FF;
   
 }
  }
  static String formatPrice(int price) {
    return price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
    
  }
}
