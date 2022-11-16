import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:surah_munjiat_v2/Constant/color.dart';
import 'package:surah_munjiat_v2/Routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => Sizer(
        builder: (BuildContext context, Orientation orientation,
            DeviceType deviceType) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.grey[100],
              primaryColor: primaryColor,
              textTheme: GoogleFonts.poppinsTextTheme(
                Theme.of(context).textTheme,
              ),
              colorScheme: const ColorScheme.light(primary: primaryColor),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
              fontFamily: GoogleFonts.poppins.toString(),
              appBarTheme: const AppBarTheme(
                centerTitle: true,
                color: primaryColor,
                elevation: 0,
              ),
            ),
            navigatorObservers: const [],
            initialRoute: '/splashScreen',
            getPages: AppPages.pageList,
          );
        },
      );
}
