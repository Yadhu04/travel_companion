import 'package:calendar_date_picker2/calendar_date_picker2.dart';
// import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_companion/components/interests.dart';
import 'package:travel_companion/provider/info_provider.dart';

class InfoCollector extends StatelessWidget {
  const InfoCollector({super.key});

  @override
  Widget build(BuildContext context) {
    var details = Provider.of<InfoProvider>(context, listen: false);

    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: details.pageController,
      itemCount: 5,
      itemBuilder: (context, index) {
        print(index);
        switch (index) {
          case 0:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: Icon(Icons.calendar_month)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Travel Durations ',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Enter the number of days for your trip'),
                  const SizedBox(
                    height: 30,
                  ),
                  Consumer<InfoProvider>(
                    builder: (context, value, child) => Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  details.tripDurationSub();
                                },
                                icon: const Icon(Icons.remove)),
                            Text('${details.tripDuration} Days'),
                            IconButton(
                                onPressed: () {
                                  details.tripDurationAdd();
                                },
                                icon: const Icon(Icons.add)),
                          ],
                        )),
                  )
                ],
              ),
            );

          // case 2

          case 1:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.purple,
                          child: Icon(Icons.calendar_month)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Start Date ',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Choose the start date for your trip'),
                  const SizedBox(
                    height: 30,
                  ),
                  Consumer<InfoProvider>(
                    builder: (context, value, child) => CalendarDatePicker2(
                      config: CalendarDatePicker2Config(
                        selectedDayHighlightColor: Colors.blue,
                        calendarType: CalendarDatePicker2Type.range,
                      ),
                      value: [
                        details.temp,
                        details.temp
                            ?.add(Duration(days: details.tripDuration - 1))
                        // DateTime(2024, 04, 13).add(const Duration(days: 7))
                      ],
                      onValueChanged: (value) {
                        details.datepick(value.first);
                        print(details.temp);
                      },
                    ),
                  )
                ],
              ),
            );

          // case 3

          case 2:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.green[900],
                          child: const Icon(Icons.group)),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Travel Companions ',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Select your travel group type'),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            details.handleButtonPressed(0);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                details.selectedButton == 0
                                    ? Colors.blue
                                    : Colors.white,
                              ),
                              shape: const MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))))),
                          child: SizedBox(
                            height: 90,
                            width: 45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 45,
                                    width: 45,
                                    decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    child: const Icon(
                                      Icons.man,
                                      color: Colors.amber,
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text("Solo")
                              ],
                            ),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            details.handleButtonPressed(1);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                details.selectedButton == 0
                                    ? Colors.blue
                                    : Colors.white,
                              ),
                              shape: const MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))))),
                          child: SizedBox(
                            height: 90,
                            width: 45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 45,
                                    width: 45,
                                    decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    child: const Icon(
                                      Icons.group,
                                      color: Colors.amber,
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text("Couple")
                              ],
                            ),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            details.handleButtonPressed(2);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                details.selectedButton == 2
                                    ? Colors.blue
                                    : Colors.white,
                              ),
                              shape: const MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))))),
                          child: SizedBox(
                            height: 90,
                            width: 45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 45,
                                    width: 45,
                                    decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    child: const Icon(
                                      Icons.family_restroom,
                                      color: Colors.amber,
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text("Family")
                              ],
                            ),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            details.handleButtonPressed(3);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                details.selectedButton == 3
                                    ? Colors.blue
                                    : Colors.white,
                              ),
                              shape: const MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))))),
                          child: SizedBox(
                            height: 90,
                            width: 48,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 45,
                                    width: 45,
                                    decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    child: const Icon(
                                      Icons.group,
                                      color: Colors.amber,
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text("Friends")
                              ],
                            ),
                          )),
                    ],
                  )
                ],
              ),
            );
          // your intrest
          case 3:
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.purple,
                          child: Icon(Icons.format_list_numbered_sharp)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Your Interests ',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('select the catagory you are intrested'),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      Interests(
                        icon: Icons.account_balance_rounded,
                        text: 'Historical',
                        interestsValue: 'historic',
                        index: 0,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Interests(
                        icon: Icons.temple_buddhist,
                        text: 'Cultural',
                        interestsValue: 'cultural',
                        index: 1,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Interests(
                        icon: Icons.apartment_rounded,
                        text: 'Architecture',
                        interestsValue: 'architecture',
                        index: 2,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Interests(
                          icon: Icons.nature,
                          text: 'Natural',
                          interestsValue: 'natural',
                          index: 3),
                      SizedBox(
                        height: 20,
                      ),
                      Interests(
                          icon: Icons.church_rounded,
                          text: 'Religion',
                          interestsValue: ' religion',
                          index: 4)
                    ],
                  )
                ],
              ),
            );
        }
        return null;
      },
    );
  }
}
