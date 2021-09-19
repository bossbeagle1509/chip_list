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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Basic usage
          const Text('Basic usage'),
          const SizedBox(
            height: 10,
          ),
          ChipList(
            listOfChipNames: _dogeNames,
            activeBgColor: Theme.of(context).primaryColor,
            inactiveBgColor: Colors.white,
            activeTextColor: Colors.white,
            inactiveTextColor: Theme.of(context).primaryColor,
            listOfChipIndicesCurrentlySeclected: [0],
            borderColorList: [Theme.of(context).primaryColor],
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
            activeBgColor: Theme.of(context).primaryColor,
            inactiveBgColor: Colors.white,
            activeTextColor: Colors.white,
            inactiveTextColor: Theme.of(context).primaryColor,
            listOfChipIndicesCurrentlySeclected: [0],
            borderColorList: [Colors.pink, Colors.yellow, Colors.green],
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
            activeBgColor: Theme.of(context).primaryColor,
            inactiveBgColor: Colors.white,
            activeTextColor: Colors.white,
            inactiveTextColor: Theme.of(context).primaryColor,
            listOfChipIndicesCurrentlySeclected: [_currentIndex],
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
              activeBgColor: Theme.of(context).primaryColor,
              inactiveBgColor: Colors.white,
              activeTextColor: Colors.white,
              inactiveTextColor: Theme.of(context).primaryColor,
              listOfChipIndicesCurrentlySeclected: [0],
              shouldWrap: true,
              runSpacing: 10,
              spacing: 10,
            ),
          ),
        ],
      ),
    );
  }
}
