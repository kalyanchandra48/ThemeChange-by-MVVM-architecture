import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themes/theme_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeViewModel>(
        create: (_) => ThemeViewModel(),
        builder: (context, _) => ValueListenableBuilder<bool>(
              valueListenable: ThemeViewModel.of(context).darkTheme,
              builder: (context, value, _) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    brightness: value ? Brightness.dark : Brightness.light,
                    primarySwatch: Colors.blue,
                  ),
                  home: ValueListenableBuilder<bool>(
                    valueListenable: ThemeViewModel.of(context).darkTheme,
                    builder: (context, value, child) => Scaffold(
                      appBar: AppBar(actions: [
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: GestureDetector(
                              onTap: () {
                                ThemeViewModel.of(context).changeTheme(value);
                              },
                              child:
                                  Icon(value ? Icons.sunny : Icons.dark_mode)),
                        )
                      ]),
                    ),
                  )),
            ));
  }
}
