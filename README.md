

# custom_switch_button



Customized switch button to make your flutter development easier and more fun to do.

## Get started

### Add dependency

```yaml
dependencies:
  custom_switch_button: ^0.5.0
```

### Example

```dart
import 'package:custom_switch_button/custom_switch_button.dart';

bool isChecked = false;

return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Switch Button example app'),
        ),
        body: GestureDetector(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
            });
          },
          child: Center(
            child: CustomSwitchButton(
              backgroundColor: Colors.blueGrey,
              unCheckedColor: Colors.white,
              animationDuration: Duration(milliseconds: 400),
              checkedColor: Colors.lightGreen,
              checked: isChecked,
            ),
          ),
        ),
      ),
    );

```

![](https://media.giphy.com/media/L0HoSU55qlPoWqZ2RB/giphy.gif)

