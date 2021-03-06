import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class ThemeService{
//   static final darkTheme = ThemeData(
//     brightness: Brightness.dark,
//     scaffoldBackgroundColor: const Color(0xff23252D),
//     backgroundColor: const Color(0xff23252D),
//     appBarTheme: AppBarTheme(
//       color: const Color(0xff23252D),
//     ),
//     textTheme: TextTheme(
//       headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
//       headline4: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
//       headline5: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//       headline6: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
//       subtitle1: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)
//     )
//
//   );
// }

enum SelectedTheme { dark, light }
class ThemeService {
    final prefs;

    static Map<SelectedTheme, ThemeData> themeMap = {
        SelectedTheme.dark : ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(0xff23252D),
            backgroundColor: const Color(0xff23252D),
            appBarTheme: AppBarTheme(
                color: const Color(0xff23252D),
            ),
            textTheme: TextTheme(
                headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
                headline4: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
                headline5: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                headline6: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
                subtitle1: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)
            )

        ),

        SelectedTheme.light : ThemeData(
            primaryColor: Colors.blue,
            backgroundColor: Colors.white,
            buttonColor: Colors.black,
            unselectedWidgetColor: Colors.white,
            primaryTextTheme: TextTheme(caption: new TextStyle(color: Colors.white)))
    };

  ThemeService(this.prefs);

  ThemeData getTheme(){
      var themeIndex = prefs.getInt("theme") ?? 0;
      return themeMap[SelectedTheme.values[themeIndex]];
  }

  void switchTheme() async{
      final themeIndex = prefs.getInt("theme") ?? 1;
      if(themeIndex == 0){
          prefs.setInt('theme', 1);
      }else{
          prefs.setInt('theme', 0);
      }
  }
}