import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_companion/components/info_collector.dart';
import 'package:travel_companion/provider/info_provider.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  // final PageController _pageController = PageController();

  @override
  @override
  Widget build(BuildContext context) {
    var details = Provider.of<InfoProvider>(context, listen: false);
    return Scaffold(
        body: SafeArea(
      child: Consumer<InfoProvider>(
        builder: (context, value, child) => Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        details.previousPage(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Step ${details.pageCount}/5',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 250,
                        child: LinearProgressIndicator(
                          value: details.stepValue,
                          backgroundColor: Colors.grey,
                          color: Colors.blue,
                          minHeight: 15,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 680,
              child: InfoCollector(),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  details.nextPage(context);
                },
                style: const ButtonStyle(
                    // minimumSize: MaterialStatePropertyAll(),
                    backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                child: const Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ))
          ],
        ),
      ),
    ));
  }
}
