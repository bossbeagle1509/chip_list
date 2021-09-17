## Features

Creates a list of `ChoiceChips`. Also allows for selecting multiple chips at once and allows use in sync with other widgets.

See `/example/main.dart` for an example on how to use the state of the list for updating the state of other widgets, and using the `shouldWrap` property.

## Getting started

Depend on it ! Add this to your `pubspec.yaml`

```dart
chip_list: ^0.1.2+5
```

Import it !

```dart
import 'package:chip_list/chip_list.dart';
```

---

## Demo

![](https://raw.githubusercontent.com/bossbeagle1509/chip_list/main/example_gif.gif)

## Usage

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

## In, brief:

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

## Note - Wrapping the contents of `ChipList`
If you want to wrap the `ChipList`, then set `shouldWrap` to `true`. 
You can then use all the properties of a typical `Wrap` widget to further customize appearance.

## Additional information

Found an issue ? [Please let me know !](https://github.com/bossbeagle1509/chip_list/issues)
Feel like creating a PR ? Yes please ! All contributions are welcome :)

## Upcoming features:

1. Transition animations
2. Per item text and background colorization
3. Border customizability
