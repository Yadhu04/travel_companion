import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.text, required this.icon});

  final String text;
  // Function ontap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: const ButtonStyle(
            padding: MaterialStatePropertyAll(
                EdgeInsets.only(left: 20, bottom: 15, top: 15)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))))),
        icon: Icon(
          icon,
          color: Colors.black,
        ),
        onPressed: () {},
        label: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.black)
          ],
        ));
  }
}
