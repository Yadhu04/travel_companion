import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_companion/provider/location_provider.dart';
import 'package:travel_companion/screens/information_page.dart';

class TripPage extends StatefulWidget {
  const TripPage({super.key});

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  TextEditingController destinationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var dataModel = Provider.of<LocationProvider>(context);
    print(dataModel.data);

    return SafeArea(child: Consumer(builder: (context, value, child) {
      return Scaffold(
          body: Stack(children: [
        Positioned(
            right: 20,
            child: IconButton(
                iconSize: 30,
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Destination',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 350,
                                child: TextField(
                                  controller: destinationController,
                                  textInputAction: TextInputAction.search,
                                  decoration: const InputDecoration(
                                      hintText: 'search destination',
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(72, 0, 0, 0))),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    dataModel.fetchLocation(
                                        location: destinationController.text);
                                    print("hiii");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const InformationPage(),
                                        ));
                                  },
                                  icon: const Icon(Icons.search))
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))))),
                icon: const Icon(Icons.add)))
      ]));
    }));
  }
}
