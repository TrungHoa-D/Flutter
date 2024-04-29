import 'package:flutter/foundation.dart';
import 'package:homework_6/data.dart';

class MoneyFormatter {
  static String formatMoney(int money) {
    String moneyString = money.toString();
    String formattedString = '';
    int count = 0;
    for (int i = moneyString.length - 1; i >= 0; i--) {
      formattedString = moneyString[i] + formattedString;
      count++;
      if (count % 3 == 0 && i != 0) {
        formattedString = ",$formattedString";
      }
    }
    return "$formattedStringđ";
  }
}

class Cart with ChangeNotifier, DiagnosticableTreeMixin {
  int all = 0;
  int money = 0;
  final List<int> cartList =
      List.generate(FoodData.listFoods.length, (index) => 0);
  void add(int id) {
    cartList[id]++;
    all++;
    money += FoodData.listFoods.elementAt(id).cost;
    notifyListeners();
  }

  void minus(int id) {
    cartList[id]--;
    all--;
    money -= FoodData.listFoods.elementAt(id).cost;
    notifyListeners();
  }

  void reset() {
    for (int i = 0; i < cartList.length; i++) {
      if (cartList[i] > 0) {
        all -= cartList[i];
        money -= cartList[i] * FoodData.listFoods.elementAt(i).cost;
        cartList[i] = 0;
      }
    }
    notifyListeners();
  }

  void listen() {
    notifyListeners();
  }
}
