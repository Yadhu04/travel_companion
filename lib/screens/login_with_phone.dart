import 'package:flutter/material.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({super.key});

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.fill)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Enter Your Phone Number',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(
                  height: 40,
                ),
                // SizedBox(
                //   width: 350,
                //   child: IntlPhoneField(
                //     controller: phoneController,
                //     decoration: InputDecoration(
                //         enabledBorder: const OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.white),
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(20))),
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(20))),
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: () {}, child: const Text('get otp'))
              ],
            )));
  }
}
