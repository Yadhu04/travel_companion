import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:travel_companion/provider/info_provider.dart';
import 'package:travel_companion/provider/location_provider.dart';

class Itinary extends StatelessWidget {
  const Itinary({super.key});
  // launchURL({required String lat, required String log}) async {
  //   final String googleMapslocationUrl =
  //       "https://www.google.com/maps/search/?api=1&query=$lat,$log";

  //   final String encodedURl = Uri.encodeFull(googleMapslocationUrl);
  //   print('hii $lat,how $log');
  //   if (await canLaunchUrl(Uri.parse(encodedURl))) {
  //     await launchUrl(Uri.parse(encodedURl));
  //   } else {
  //     print('Could not launch $encodedURl');
  //     throw 'Could not launch $encodedURl';
  //   }
  // }

  void launchURL({required double latitude, required double longitude}) async {
    try {
      await MapsLauncher.launchCoordinates(
        latitude, longitude,
        // title: "Specific Location" // Optional title for the destination
      );
    } catch (error) {
      print('Error launching Google Maps: $error');
      // Handle error gracefully (e.g., display a message to the user)
    }
  }

  @override
  Widget build(BuildContext context) {
    var info = Provider.of<InfoProvider>(context, listen: false);
    var location = Provider.of<LocationProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  height: 100,
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            location.destinationController.text,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${info.tripDuration.toString()} days'),
                            Text(info.temp.toString())
                          ])
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              ToggleSwitch(
                minWidth: 90.0,
                minHeight: 70,
                cornerRadius: 20.0,
                activeBgColors: const [
                  [Colors.blue],
                  [Colors.blue],
                  [Colors.blue],
                  [Colors.blue],
                  [Colors.blue],
                  [Colors.blue],
                ],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.white,
                inactiveFgColor: Colors.black,
                initialLabelIndex: 0,
                totalSwitches: info.tripDuration,
                labels: const ['Day 1', 'Day 2', 'Day 3', 'Day 4'],
                radiusStyle: true,
                onToggle: (index) {
                  print(index);
                  // print(location.dateIndex);

                  // location.datechange(index);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer(
                builder: (context, value, child) => Container(
                  padding: const EdgeInsets.only(left: 30, right: 20),
                  height: 500,
                  width: 400,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      int loopIndex = index + location.dateIndex;
                      // index = location.dateIndex;
                      // Consumer<LocationProvider>(builder: (context, value, child) => index = index + location.dateIndex);
                      print(index);
                      return Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        height: 350,
                        width: 350,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200,
                              width: 330,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/%D0%9F%D1%83%D1%88%D0%BA%D0%B8%D0%BD%D1%81%D0%BA%D0%B8%D0%B9_%D0%B4%D1%83%D0%B1.jpg/597px-%D0%9F%D1%83%D1%88%D0%BA%D0%B8%D0%BD%D1%81%D0%BA%D0%B8%D0%B9_%D0%B4%D1%83%D0%B1.jpg?20150524151716',
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      location.data!.features[loopIndex]
                                          .properties.name,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(loopIndex.toString()),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25))),
                                      child: IconButton(
                                          onPressed: () {
                                            launchURL(
                                              latitude: location
                                                  .data!
                                                  .features[loopIndex]
                                                  .geometry
                                                  .coordinates[1],
                                              longitude: location
                                                  .data!
                                                  .features[loopIndex]
                                                  .geometry
                                                  .coordinates[0],
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.map,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
