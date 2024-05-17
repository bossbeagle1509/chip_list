// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:chip_list/chip_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chip List Demo',
      theme: ThemeData(primarySwatch: Colors.teal, primaryColor: Colors.teal),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _dogeNames = [
    'Beagle',
    'Labrador',
    'Retriever',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chip List Demo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Basic usage
            const Text('Basic usage'),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ChipList(
                listOfChipNames: _dogeNames,
                activeBgColorList: [Theme.of(context).primaryColor],
                inactiveBgColorList: const [Colors.white],
                activeTextColorList: const [Colors.white],
                inactiveTextColorList: [Theme.of(context).primaryColor],
                listOfChipIndicesCurrentlySelected: [],
                activeBorderColorList: [Theme.of(context).primaryColor],
                inactiveBorderColorList: [Colors.brown, Colors.pink, Colors.teal],
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            const Text('Basic usage - using border colors'),
            const SizedBox(
              height: 10,
            ),

            // Without a background color, instead leveraging
            // the active and inactive border colors
            Center(
              child: ChipList(
                listOfChipNames: _dogeNames,
                activeBgColorList: const [Colors.white],
                // activeBgColorList: [Theme.of(context).primaryColor],
                inactiveBgColorList: const [Colors.white],
                activeTextColorList: [Theme.of(context).primaryColor],
                inactiveTextColorList: [Theme.of(context).primaryColor],
                listOfChipIndicesCurrentlySelected:  [0],
                activeBorderColorList: [Theme.of(context).primaryColor],
                tooltips: ["Colorful","Plump","Energetic"],
              ),
            ),

            // Using [supportsMultiSelect]
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Using supportsMultiSelect - using border colors and text color',
            ),
            const SizedBox(
              height: 10,
            ),
            ChipList(
              listOfChipNames: _dogeNames,
              supportsMultiSelect: true,
              activeBgColorList: const [Colors.white],
              inactiveBgColorList: const [Colors.white],
              activeTextColorList: const [
                Colors.pink,
                Colors.yellow,
                Colors.green
              ],
              inactiveTextColorList: [Theme.of(context).primaryColor],
              listOfChipIndicesCurrentlySelected: [0],
              inactiveBorderColorList: const [Colors.white],
              activeBorderColorList: const [
                Colors.pink,
                Colors.yellow,
                Colors.green
              ],
            ),

            // Using [supportsMultiSelect]
            const SizedBox(
              height: 20,
            ),
            const Text('Using supportsMultiSelect'),
            const SizedBox(
              height: 10,
            ),
            ChipList(
              listOfChipNames: _dogeNames,
              supportsMultiSelect: true,
              activeBgColorList: const [
                Colors.pink,
                Colors.yellow,
                Colors.green
              ],
              inactiveBgColorList: const [Colors.white],
              activeTextColorList: const [Colors.white],
              inactiveTextColorList: [Theme.of(context).primaryColor],
              listOfChipIndicesCurrentlySelected: [0],
              inactiveBorderColorList: const [
                Colors.pink,
                Colors.yellow,
                Colors.green
              ],
              activeBorderColorList: const [
                Colors.pink,
                Colors.yellow,
                Colors.green
              ],
            ),

            // Using [extraOnToggle]
            const SizedBox(
              height: 20,
            ),
            Text('Using extraOnToggle: ${_dogeNames[_currentIndex]}'),
            const SizedBox(
              height: 10,
            ),
            ChipList(
              listOfChipNames: _dogeNames,
              activeBgColorList: [Theme.of(context).primaryColor],
              inactiveBgColorList: const [Colors.white],
              activeTextColorList: const [Colors.white],
              inactiveTextColorList: [Theme.of(context).primaryColor],
              listOfChipIndicesCurrentlySelected: [_currentIndex],
              inactiveBorderColorList: const [Colors.teal],
              extraOnToggle: (val) {
                _currentIndex = val;
                setState(() {});
              },
            ),
            // Using [shouldWrap]
            const SizedBox(
              height: 20,
            ),
            const Text('Using shouldWrap'),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 150,
              child: ChipList(
                listOfChipNames: const [
                  'a',
                  'really',
                  'long',
                  'list',
                  'of',
                  'chips',
                  'that',
                  'can',
                  'be',
                  'wrapped',
                ],
                activeBgColorList: [Theme.of(context).primaryColor],
                inactiveBgColorList: const [
                  Colors.white,
                ],
                activeTextColorList: const [Colors.white],
                inactiveTextColorList: [Theme.of(context).primaryColor],
                listOfChipIndicesCurrentlySelected: [0],
                shouldWrap: true,
                runSpacing: 10,
                spacing: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
