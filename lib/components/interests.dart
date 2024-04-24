import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_companion/provider/info_provider.dart';

class Interests extends StatelessWidget {
  const Interests(
      {super.key,
      required this.icon,
      required this.text,
      required this.interestsValue});
  final String text;
  final String interestsValue;
  final IconData icon;

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
            value: details.isSelected,
            onChanged: (newValue) {
              details.toogleSwitch();
              if (newValue == false) {
                details.intrest.add(interestsValue);
              } else {
                details.intrest.remove(interestsValue);
              }
            },
          )
        ],
      ),
    );
  }
}

                          // Interests(
                          //     icon: Icons.account_balance_rounded,
                          //     text: 'Historical',
                          //     interestsValue: 'historic'),
                          // Interests(
                          //     icon: Icons.temple_buddhist,
                          //     text: 'Cultural',
                          //     interestsValue: 'cultural'),
                          // Interests(
                          //     icon: Icons.apartment_rounded,
                          //     text: 'Architecture',
                          //     interestsValue: 'architecture')
