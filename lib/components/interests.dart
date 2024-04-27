import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_companion/provider/info_provider.dart';

class Interests extends StatelessWidget {
  const Interests(
      {super.key,
      required this.icon,
      required this.text,
      required this.interestsValue,
      required this.index});
  final String text;
  final String interestsValue;
  final IconData icon;
  final int index;
  @override
  Widget build(BuildContext context) {
    var details = Provider.of<InfoProvider>(context, listen: false);
    return Consumer<InfoProvider>(
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.blue,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Switch(
            value: details.isSelected[index],
            onChanged: (newValue) {
              // newValue = details.isSelected[index];
              details.toogleSwitch(index, interestsValue);
              // print(newValue);
              // print("${details.isSelected[index]},$index");
              // if (newValue == true) {
              //   details.intrest.add(interestsValue);
              // }
              // if (newValue == false) {
              //   details.intrest.remove(interestsValue);
              // }
            },
          )
        ],
      ),
    );
  }
}
