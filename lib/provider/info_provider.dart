import 'package:flutter/material.dart';
import 'package:travel_companion/screens/itinary.dart';

class InfoProvider extends ChangeNotifier {
  final PageController pageController = PageController();
  var pageCount = 1;
  double stepValue = 0.2;
  int tripDuration = 0;
  DateTime? temp;
  List intrest = [];
  // int get pageCount => pageCount;
  // double get stepValue => stepValue;

  nextPage(BuildContext context) {
    pageController.animateToPage(pageCount,
        duration: const Duration(milliseconds: 5), curve: Curves.linear);
    pageCount++;
    stepValue = stepValue + 0.2;
    notifyListeners();

    if (pageCount == 6) {
      pageCount = 1;
      stepValue = 0.2;
      notifyListeners();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Itinary(),
          ));
    }
  }

  previousPage(BuildContext context) {
    if (pageCount == 1) {
      Navigator.pop(context);

      pageCount = 1;
      stepValue = 0.2;
      notifyListeners();
    }

    pageCount--;
    stepValue = stepValue - 0.2;
    pageController.animateToPage((pageCount - 1),
        duration: const Duration(milliseconds: 2), curve: Curves.linear);
    notifyListeners();
  }

  tripDurationAdd() {
    tripDuration++;
    notifyListeners();
  }

  tripDurationSub() {
    tripDuration--;
    notifyListeners();
  }

  datepick(value) {
    temp = value;
    notifyListeners();
  }

  int? selectedButton;

  void handleButtonPressed(int index) {
    selectedButton = index;
    print(selectedButton);
    notifyListeners();
  }

  bool isSelected = false;
  void toogleSwitch() {
    isSelected = !isSelected;
    print(intrest);
    notifyListeners();
  }
}
