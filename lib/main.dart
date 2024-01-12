// ignore_for_file: prefer_const_constructors
import 'package:chatting/screens/chat_page.dart';
import 'package:chatting/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc_observer.dart';
import 'firebase_options.dart';
main() async
{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:Colors.white,
      statusBarIconBrightness:Brightness.dark
  ));
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
          scaffoldBackgroundColor:Colors.white,
          bottomNavigationBarTheme:const BottomNavigationBarThemeData(
              type:BottomNavigationBarType.fixed,
              backgroundColor:Colors.white,
              elevation:0.0
          ),
          appBarTheme:const AppBarTheme(
              titleTextStyle:TextStyle(color:Colors.black,fontSize:20.0,fontWeight:FontWeight.bold),
              color:Colors.white,
              elevation:0.0,
              systemOverlayStyle:SystemUiOverlayStyle(
                  statusBarColor:Colors.white,
                  statusBarIconBrightness:Brightness.dark
              )
          )
      ),
      debugShowCheckedModeBanner:false,
      home:SplashScreen(),
      routes: {
        'chatPage':(context)=>ChatPage(),
      },
    );
  }
}