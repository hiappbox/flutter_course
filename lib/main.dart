import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/article_app/article_app_screen.dart';
import 'package:flutter_course/counter%20app/counterProvider.dart';
import 'package:flutter_course/firebase_options.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Counter App',
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              )
            )
          ),
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.deepPurple,width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.deepPurple,width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
          ),
          useMaterial3: true,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const ArticleAppScreen(),
      ),
    );
  }
}
