// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:travel_companion/components/profile_button.dart';
import 'package:travel_companion/provider/profile_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    ProfileProvider profile =
        Provider.of<ProfileProvider>(context, listen: false);
    return ListView(children: [
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Consumer<ProfileProvider>(
            builder: (context, value, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Profile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                // profile pic
                Row(
                  children: [
                    Stack(children: [
                      CircleAvatar(
                        backgroundImage: profile.imageFile != null
                            ? NetworkImage(profile.imageurl.toString())
                            : NetworkImage(profile.currentPic.toString()),
                        backgroundColor: Colors.blue,
                        radius: 60,
                      ),
                      Positioned(
                          bottom: 10,
                          right: 10,
                          child: IconButton(
                              onPressed: () {
                                showPress(context);
                              },
                              icon: const Icon(Icons.image),
                              style: const ButtonStyle(
                                iconColor:
                                    MaterialStatePropertyAll(Colors.white38),
                              )))
                    ]),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Hi,Yadhu',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text("Appearance",
                    style: TextStyle(color: Colors.grey, fontSize: 25)),
                const SizedBox(
                  height: 10,
                ),

                ToggleSwitch(
                  totalSwitches: 2,
                  labels: const ['Light', "Dark"],
                  minWidth: 120,
                  borderWidth: 10,
                  borderColor: const [Colors.white],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Profile",
                    style: TextStyle(color: Colors.grey, fontSize: 25)),
                const SizedBox(
                  height: 10,
                ),
                const MyButton(
                    text: 'Edit Personal Information ',
                    icon: Icons.account_circle),
                const SizedBox(height: 10),
                const MyButton(
                    text: 'Edit Interests ',
                    icon: Icons.change_circle_outlined),
                const SizedBox(height: 10),
                const MyButton(
                    text: 'Edit extra Information ', icon: Icons.map_outlined),
                const SizedBox(height: 15),

                const Text("More",
                    style: TextStyle(color: Colors.grey, fontSize: 25)),
                const SizedBox(
                  height: 15,
                ),
                const MyButton(
                    text: 'About ', icon: Icons.question_mark_rounded),
                const SizedBox(height: 10),
                const MyButton(
                    text: 'Terms Of Use', icon: Icons.shield_rounded),
                const SizedBox(height: 10),
                const MyButton(
                    text: ' Privacy Policy', icon: Icons.privacy_tip),
                const SizedBox(height: 10),
                const MyButton(text: 'Log Out ', icon: Icons.logout),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

void showPress(BuildContext context) {
  ProfileProvider profile =
      Provider.of<ProfileProvider>(context, listen: false);

  showModalBottomSheet(
    isDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    // backgroundColor: Colors.cyan,
    context: context,
    builder: (context) {
      return SizedBox(
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Select an Image',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      profile.getCamera();
                      Navigator.pop(context);
                    },
                    child: const Text('Camera',
                        style: TextStyle(color: Colors.black))),
                ElevatedButton(
                  onPressed: () {
                    profile.getImage();
                    Navigator.pop(context);
                  },
                  child: const Text('Storage',
                      style: TextStyle(color: Colors.black)),
                )
              ],
            )
          ],
        ),
      );
    },
  );
}
