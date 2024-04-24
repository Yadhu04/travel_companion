import 'package:flutter/material.dart';

class MYButtton extends StatefulWidget {
  const MYButtton(
      {super.key,
      required this.text,
      required this.icon,
      required this.ind,
      required this.ontap});
  final String text;
  final int ind;
  final Function ontap;
  final Icon icon;
  @override
  State<MYButtton> createState() => _MYButttonState();
}

class _MYButttonState extends State<MYButtton> {
  int ind = 0;
  int selectedButton = 0;

  void _handleButtonPressed(int index) {
    setState(() {
      selectedButton = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                selectedButton == ind ? Colors.blue : Colors.white),
            shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))))),
        onPressed: () {},
        child: SizedBox(
          height: 90,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: const Icon(
                    Icons.man,
                    color: Colors.amber,
                  )),
              const SizedBox(
                height: 5,
              ),
              const Text('text')
            ],
          ),
        ));
  }
}
