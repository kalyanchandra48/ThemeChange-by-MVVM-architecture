import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeViewModel extends ChangeNotifier {
  static ThemeViewModel of(BuildContext context) =>
      context.read<ThemeViewModel>();

  ValueNotifier<bool> darkTheme = ValueNotifier(true);

  changeTheme(bool value) {
    darkTheme.value = !value;
  }
}
