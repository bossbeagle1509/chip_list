## Features

Creates a list of `ChoiceChips`. Also allows for selecting multiple chips at once and exposes all values to use in case you wish to use the widget in sync with others.

See `/example/main.dart` for an example on how to use the state of the list for updating the state of other widgets.

## Getting started

Import it !

```dart
import 'package:chip_list/chip_list.dart';
```

## Usage

Check out the `/example` folder for a minimal working demo of the package in action.

![](example\example_gif.gif)


`/example/main.dart`:
```dart
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
      body: Center(
        child: Column(
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
          ],
        ),
      ),
    );
  }
}
```


But, briefly:

```dart
ChipList(
    listOfChipNames: _theListOfStringsYouWishToDisplay,
    activeBgColor: _anActiveBackgroundColor,
    inactiveBgColor: _anInactiveBackgroundColor,
    activeTextColor:_anAactiveTextColor,
    inactiveTextColor: _anInactiveTextColor,
    listOfChipIndicesCurrentlySeclected: [index/indices depending on the use case],
),
```
## Additional information

Found an issue ? [Please let me know !](https://github.com/bossbeagle1509/chip_list/issues)

Upcoming features:

1. Transition animations
2. Per item text and background colorization
3. Border customizability
